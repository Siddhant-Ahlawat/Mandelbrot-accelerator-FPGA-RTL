///////////////////////////////////////////////////////////////////////
// Mouse test from 
// http://stackoverflow.com/questions/11451618/how-do-you-read-the-mouse-button-state-from-dev-input-mice
//
// Native ARM GCC Compile: gcc mouse_test.c -o mouse
//
///////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/ipc.h> 
#include <sys/shm.h> 
#include <sys/mman.h>
#include <sys/time.h> 
#include <math.h>



// measure time
struct timeval t1, t2;
double elapsedTime;

#define _GNU_SOURCE 

#define TRUE 1
#define FALSE 0
#define FPGA_CHAR_BASE        0xC9000000
#define FPGA_CHAR_END         0xC9001FFF
#define FPGA_CHAR_SPAN        0x00002000
#define MYPIO_XI              0x00000000
#define MYPIO_YI              0x00000010
#define MYPIO_ZOOM            0x00000020
#define MYPIO_ZOOM_OUT        0x00000040
#define MYPIO_PAN             0x00000030
#define MYPIO_STEP_R          0x00000050
#define MYPIO_FINISH          0x00000060
#define MYPIO_STEP_I          0x00000100
#define MYPIO_MAX_ITERATIONS  0x00000070
#define MYPIO_CI_INIT         0x00000080
#define MYPIO_CR_INIT         0x00000090
#define MYPIO_RESET_MANDEL    0x00000110
/* Cyclone V FPGA devices */
#define HW_REGS_BASE          0xff200000
//#define HW_REGS_SPAN        0x00200000 
#define HW_REGS_SPAN          0x00005000 
// the light weight buss base

//typedef signed int fix;
//#define int2fix(a) ((signed int))((a) << 23))
//#define float2fix(a) ((fix))(a * 1048576.0)
#define fix2float(a) ((float)(a) / 8388608.0)
#define float2fix(a) (signed int)(a * 8388608.0)



// access to enter condition
// -- for signalling enter done
pthread_mutex_t enter_lock= PTHREAD_MUTEX_INITIALIZER;
// access to print condition
// -- for signalling print done
pthread_mutex_t print_lock= PTHREAD_MUTEX_INITIALIZER;
// counter protection
pthread_mutex_t count_lock= PTHREAD_MUTEX_INITIALIZER;

// the two condition variables related to the mutex above
pthread_cond_t enter_cond ;
pthread_cond_t print_cond ;

// globals for perfromance
int count1, count2;

void *h2p_lw_virtual_base;

volatile unsigned int *mypio_xi_write_ptr = NULL;
volatile unsigned int *mypio_yi_write_ptr = NULL;
volatile unsigned int *mypio_zoom_write_ptr = NULL;
volatile unsigned int *mypio_zoom_out_write_ptr = NULL;
volatile unsigned int *mypio_pan_write_ptr = NULL;
volatile unsigned int *mypio_step_r_write_ptr = NULL;
volatile unsigned int *mypio_finish_write_ptr = NULL;
volatile unsigned int *mypio_step_i_write_ptr = NULL;
volatile unsigned int *mypio_max_iterations_write_ptr = NULL;
volatile unsigned int *mypio_ci_init_write_ptr = NULL;
volatile unsigned int *mypio_cr_init_write_ptr = NULL;
volatile unsigned int *mypio_reset_mandel_write_ptr = NULL;



int md;
int right_debounce=0;
int left_debounce=0;
int middle_debounce=0;
int start_zoom=0;
int middle_start=0;
int right_start=0;
int x_accum=0,y_accum=0;
   int start_flag=0;
   int finish_flag=0;
   int flagb=0;
   int flagc=0;
    int read_speed=10;
    int left=0, middle=0, right=0;
    //int iterations=1000;
   signed int step_i=34952;
   signed int step_r=39321;
   signed int ci_init=8388608;
   signed int cr_init=-16777216;
signed char x, y;
signed int x_cod=0,y_cod=0;
       int md;
    unsigned char data[3];
int timee=0,max_iterations=1000;
int fd, bytes;
int new_print=0;
long long int print_time=0;
int reset_sig;
int print_debounce=0;
int start_count=0;
int time_done=1;
///////////////////////////////////////////////////////////////
// read the keyboard
///////////////////////////////////////////////////////////////
void * read1()
{
		while(1){
                  int prev_ti=timee;

             timee=*(mypio_finish_write_ptr); 
                

                reset_sig=*(mypio_reset_mandel_write_ptr);
                if(reset_sig==0)
                { step_i=34952;
         step_r=39321;
        ci_init=8388608;
        cr_init=-16777216;
          *(mypio_step_i_write_ptr)= step_i;
           *(mypio_step_r_write_ptr)= step_r;
             *(mypio_cr_init_write_ptr)= cr_init;
            *(mypio_ci_init_write_ptr)= ci_init;
        print_time=0;
        print_debounce=0;
        start_count=1;}

                if(new_print==0 && time_done==1){	
		 printf("enter max_iteration:=  ");
         time_done=0;}
         new_print=1;
         
          

         int prev_m=max_iterations;
		scanf("%d",&max_iterations);

            if(prev_m!=max_iterations)
            {new_print=0;
            *(mypio_max_iterations_write_ptr)= max_iterations;}

       
				
        } // while(1)
}



void * write1() {
		//sleep(1);
		// signal that the print process is ready when started
		//pthread_cond_signal(&print_cond);
		
        
    int left, middle, right;
    signed char x, y;

        while(1){

 
                // Read Mouse     
        bytes = read(fd, data, sizeof(data));

        if(bytes > 0)
        {
            left = data[0] & 0x1;
            right = data[0] & 0x2;
            middle = data[0] & 0x4;

            x = data[1];
            y = data[2];
            //printf("x=%d, y=%d, left=%d, middle=%d, right=%d\n", x_cod, y_cod, left, middle, right);
            x_accum=x_accum+x;
        
			y_accum=y_accum+y;

			if(x_accum<0)
			{x_accum=0;}
			if(y_accum<0)
			{y_accum=0;}
			if(x_accum>639)
			{x_accum=639;}
			if(y_accum>479)
			{y_accum=479;}
         x_cod=x_accum;
         y_cod=479-y_accum;

         if(left==1  )
          {
              step_i=step_i>>1;
          step_r=step_r>>1;
          ci_init= (ci_init - y_cod*(step_i<<1)) + step_i*240;
          cr_init= (cr_init + x_cod*(step_r<<1)) - step_r*320;
          //left_debounce=1;
          //start_zoom=1;
          *(mypio_step_i_write_ptr)= step_i;
           *(mypio_step_r_write_ptr)= step_r;
             *(mypio_cr_init_write_ptr)= cr_init;
            *(mypio_ci_init_write_ptr)= ci_init;
            printf(" \n \n top_left_coordinates=%f,%f \n top_right_coordinates=%f,%f \n bottom left coordinates=%f,%f \n bottom right coordinates=%f,%f \n \n \n", fix2float(cr_init),fix2float(ci_init),fix2float(cr_init)+ step_r*640,fix2float(ci_init),fix2float(cr_init),fix2float(ci_init)-480*step_i,fix2float(cr_init)+ step_r*640,fix2float(ci_init)-480*step_i);
           // *(mypio_zoom_write_ptr)= left;
             // start_zoom=0;
             new_print=0;
             print_time=0;
             print_debounce=0;
             start_count=1;
          }

           if(right==2 )
          {step_i=step_i<<1;
          step_r=step_r<<1;
          ci_init= (ci_init - y_cod*(step_i>>1)) + step_i*240;
          cr_init= (cr_init + x_cod*(step_r>>1)) - step_r*320;
          //right_debounce=1;
          //right_start=1;
          *(mypio_step_i_write_ptr)= step_i;
           *(mypio_step_r_write_ptr)= step_r;
             *(mypio_cr_init_write_ptr)= cr_init;
            *(mypio_ci_init_write_ptr)= ci_init;
             printf("\n \n top_left_coordinates=%f,%f \n top_right_coordinates=%f,%f \n bottom left coordinates=%f,%f \n bottom right coordinates=%f,%f \n \n \n", fix2float(cr_init),fix2float(ci_init),fix2float(cr_init)+ step_r*640,fix2float(ci_init),fix2float(cr_init),fix2float(ci_init)-480*step_i,fix2float(cr_init)+ step_r*640,fix2float(ci_init)-480*step_i);
            //printf("top_left_coordinates=%f,%f \n top_right_coordinates=%f,%f \n bottom left coordinates=%f,%f \n bottom right coordinates=%f,%f \n", float2fix(cr_init),float2fix(ci_init),float2fix(cr_init)+ step_r*640,float2fix(ci_init),float2fix(cr_init),float2fix(ci_init)-480*step_i,float2fix(cr_init)+ step_r*640,float2fix(ci_init)-480*step_i);
           // *(mypio_zoom_out_write_ptr)= right;
              //right_start=0;
              new_print=0;
               print_time=0;
               print_debounce=0;
               start_count=1;
          }

         if(middle==4 )
          {if(x_cod==0){
                 cr_init=cr_init - (step_r<<8);
          }
		if(x_cod==639) {
                 cr_init=cr_init + (step_r<<8);
        }
 		if(y_cod==0) {
                 ci_init=ci_init + (step_i<<8);
         }
		if(y_cod==479) {
                 ci_init=ci_init - (step_i<<8);}
              
              //middle_debounce=1;
              //middle_start=1;
               *(mypio_step_i_write_ptr)= step_i;
           *(mypio_step_r_write_ptr)= step_r;
             *(mypio_cr_init_write_ptr)= cr_init;
            *(mypio_ci_init_write_ptr)= ci_init;
             //*(mypio_pan_write_ptr)= middle;
             // middle_start=0;
             printf("\n \n  top_left_coordinates=%f,%f \n top_right_coordinates=%f,%f \n bottom left coordinates=%f,%f \n bottom right coordinates=%f,%f \n \n \n", fix2float(cr_init),fix2float(ci_init),fix2float(cr_init)+ step_r*640,fix2float(ci_init),fix2float(cr_init),fix2float(ci_init)-480*step_i,fix2float(cr_init)+ step_r*640,fix2float(ci_init)-480*step_i);
                    new_print=0;  
                     print_time=0;  
                     print_debounce=0;   
                     start_count=1;
                       
            // printf("top_left_coordinates=%f,%f \n top_right_coordinates=%f,%f \n bottom left coordinates=%f,%f \n bottom right coordinates=%f,%f \n", float2fix(cr_init),float2fix(ci_init),float2fix(cr_init)+ step_r*640,float2fix(ci_init),float2fix(cr_init),float2fix(ci_init)-480*step_i,float2fix(cr_init)+ step_r*640,float2fix(ci_init)-480*step_i);
                 }


          *(mypio_zoom_write_ptr)= left;
          *(mypio_zoom_out_write_ptr)= right;
             *(mypio_pan_write_ptr)= middle;
            *(mypio_xi_write_ptr)= x_cod;
             *(mypio_yi_write_ptr)= y_cod; 


          

    

           

          
           
        }   
        //read_speed++;
				
                     }


				//pthread_mutex_unlock(&count_lock);
				// unlock the input_buffer
				//pthread_mutex_unlock(&enter_lock);
                // and tell read1 thread that print is done
				//pthread_cond_signal(&print_cond);         
        } // while(1)




///////////////////////////////////////////////////////////////
// counter 1
///////////////////////////////////////////////////////////////
// with mutex, about 9 to 10 million/sec
// -- adding a second copy drops rate to about 4 million/sec
// -- adding a second copy pegs BOTH processors at 100%
// without mutex about 200 to 400 millon/sec
// 
void * counter1() {
		//
        while(1){

             
//printf("\n time to render in milliseconds:= %f \n ",timee/500000.0);
                if(print_time>9999 && start_count==1){
                timee=*(mypio_finish_write_ptr);
                
                print_time=0;
                start_count=0;
              printf("\n time to render in milliseconds:= %f \n ",timee/500000.0);
              time_done=1;
              printf("enter max_iteration:=  ");
                }
                usleep(500);
                print_time++;

               // if(print_time==9000 && start_count==1){printf("\n time to render in milliseconds:= %f \n ",timee/50000.0);
               // print_debounce=1;
                //start_count=0;}
				//pthread_mutex_unlock(&count_lock);
				              
        } // while(1)
}


///////////////////////////////////////////////////////////////
int main(int argc, char** argv)
{      
  
 //printf("top_left_coordinates=%f,%f \n top_right_coordinates=%f,%f \n bottom left coordinates=%f,%f \n bottom right coordinates=%f,%f \n", float2fix(cr_init),float2fix(ci_init),float2fix(cr_init)+ step_r*640,float2fix(ci_init),float2fix(cr_init),float2fix(ci_init)-480*step_i,float2fix(cr_init)+ step_r*640,float2fix(ci_init)-480*step_i);
     
    unsigned char data[3];
//needed for nonblocking read()
int flags = fcntl(fd, F_GETFL, 0);
fcntl(fd, F_SETFL, flags | O_NONBLOCK); 

    const char *pDevice = "/dev/input/mice";

    // Open Mouse
    fd = open(pDevice, O_RDWR);
    if(fd == -1)
    {
        printf("ERROR Opening %s\n", pDevice);
        return -1;
    }


//=========================================================================
// === need to mmap: =======================
	// FPGA_CHAR_BASE
	// FPGA_ONCHIP_BASE      
	// HW_REGS_BASE        
  
	// === get FPGA addresses ==================
    // Open /dev/mem
	if( ( md = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) 	{
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}
    
    // get virtual addr that maps to physical
	h2p_lw_virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, md, HW_REGS_BASE );	
	if( h2p_lw_virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap1() failed...\n" );
		close( md );
		return(1);
	}


	mypio_xi_write_ptr=(unsigned int *)(h2p_lw_virtual_base + MYPIO_XI); 
    mypio_yi_write_ptr=(unsigned int *)(h2p_lw_virtual_base + MYPIO_YI); 
	mypio_zoom_write_ptr=(unsigned int *)(h2p_lw_virtual_base + MYPIO_ZOOM); 
mypio_zoom_out_write_ptr=(unsigned int *)(h2p_lw_virtual_base + MYPIO_ZOOM_OUT); 
mypio_pan_write_ptr=(unsigned int *)(h2p_lw_virtual_base + MYPIO_PAN); 
//mypio_start_write_ptr=(unsigned int *)(h2p_lw_virtual_base + MYPIO_START); 
mypio_finish_write_ptr=(unsigned int *)(h2p_lw_virtual_base + MYPIO_FINISH); 
mypio_step_r_write_ptr=(unsigned int *)(h2p_lw_virtual_base + MYPIO_STEP_R); 
mypio_step_i_write_ptr=(unsigned int *)(h2p_lw_virtual_base + MYPIO_STEP_I); 
mypio_ci_init_write_ptr=(unsigned int *)(h2p_lw_virtual_base + MYPIO_CI_INIT); 
mypio_cr_init_write_ptr=(unsigned int *)(h2p_lw_virtual_base + MYPIO_CR_INIT);
mypio_max_iterations_write_ptr=(unsigned int *)(h2p_lw_virtual_base + MYPIO_MAX_ITERATIONS);
mypio_reset_mandel_write_ptr=(unsigned int *)(h2p_lw_virtual_base + MYPIO_RESET_MANDEL);


	// ===========================================



	reset_sig=*(mypio_reset_mandel_write_ptr);
    *(mypio_max_iterations_write_ptr)= max_iterations;           
             *(mypio_zoom_out_write_ptr)= right;
             *(mypio_pan_write_ptr)= middle;
              *(mypio_xi_write_ptr)= x_accum;
             *(mypio_yi_write_ptr)= y_accum; 
            
	         *(mypio_zoom_write_ptr)= left;
             *(mypio_step_i_write_ptr)= step_i;
           *(mypio_step_r_write_ptr)= step_r;
             *(mypio_cr_init_write_ptr)= cr_init;
            *(mypio_ci_init_write_ptr)= ci_init;
            timee=*(mypio_finish_write_ptr); 
    

 printf(" top_left_coordinates=%f,%f \n top_right_coordinates=%f,%f \n bottom left coordinates=%f,%f \n bottom right coordinates=%f,%f \n \n \n", fix2float(cr_init),fix2float(ci_init),fix2float(cr_init)+ step_r*640,fix2float(ci_init),fix2float(cr_init),fix2float(ci_init)-480*step_i,fix2float(cr_init)+ step_r*640,fix2float(ci_init)-480*step_i);

    //========================================================================
        int status;
		// the thread identifiers
        pthread_t thread_read, thread_write, thread_count1, thread_count2;
		
		// the condition variables
		pthread_cond_init (&enter_cond, NULL);
		pthread_cond_init (&print_cond, NULL);
		
		//For portability, explicitly create threads in a joinable state 
		// thread attribute used here to allow JOIN
		//pthread_attr_t attr;
		//pthread_attr_init(&attr);
		//(&attr, PTHREAD_CREATE_JOINABLE);
		// the condition variables
		pthread_cond_init (&enter_cond, NULL);
		pthread_cond_init (&print_cond, NULL);
		
		//For portability, explicitly create threads in a joinable state 
		// thread attribute used here to allow JOIN
		pthread_attr_t attr;
		pthread_attr_init(&attr);
		pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);
		// now the threads
        pthread_create(&thread_read,NULL,read1,NULL);
        pthread_create(&thread_write,NULL,write1,NULL);
		pthread_create(&thread_count1,NULL,counter1,NULL);
		// second copy of counter
		//pthread_create(&thread_count2,NULL,counter1,NULL);
		 
        pthread_join(thread_read,NULL);
		 pthread_join(thread_count1,NULL);
        pthread_join(thread_write,NULL);
        return 0;
}