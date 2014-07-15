      program plynomialFitting
      implicit real*8(a-h, o-z)
     
      ! let us test it
      integer, parameter :: degree = 3
      integer, parameter :: m = 11
      real*8, dimension(11) :: x = (/ (i,i=0,10) /)
      real*8, dimension(11) :: y = (/ 1,   6,  17,  34, 
     +                                  57,  86, 121, 162, 
     +                                  209, 262, 321 /)
      real*8, dimension(degree+1) :: a
     
!      open(10,file='pot')
!      k = 0
!      do j=1,m
!        k = k+1 
!        read(10,*) x(j),y(j),f(j)
!      enddo
!      if(k /= m) print *,'Reading error.'
!      close(10)
!      print *,'test'

      call polyfit(m,x,y,degree,a)
      print *,a 
      write (*, 6000) a(1),a(2),a(3)
6000  format('Fitting polynomial P(x) = ',
     +       f10.6,'+',f10.6,'*x + ',
     +                 f10.6,'*x^2'/)
   
      return
      end program

  
