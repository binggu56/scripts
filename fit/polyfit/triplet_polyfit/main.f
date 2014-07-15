c ---------------------------------------
c     polynomical fitting 
c     solving A*x = y, ATA*x = AT*y
c ---------------------------------------
      program plynomialFitting
      implicit real*8(a-h, o-z)
     
      ! let us test it
      integer, parameter :: degree = 5
      integer, parameter :: m = 10000
      real*8, dimension(degree+1) :: a
      real*8, dimension(m)        :: x,y,z,f
     
      open(10,file='pot')
      k = 0
      do j=1,m
        k = k+1 
        read(10,*) x(j),y(j),z(j),f(j)
      enddo
      if(k /= m) print *,'Reading error.'
      close(10)

      call multi_polyfit(m,x,y,z,f,degree,a)

      write (*, 6000) a(1),a(2),a(3),a(4),a(5),a(6)
6000  format('Fitting polynomial P(x,y) = ',
     +        f10.6, ' + ',
     +        f10.6, 'x + ',
     +        f10.6, 'y + ',
     +        f10.6, 'x^2 + ', 
     +        f10.6, 'y^2 + ',
     +        f10.6, 'xy '/)


      write(*,6666) 
 6666 format('************************'/,
     +       '*      Job Complete    *'/,
     +       '************************'/)
      return
      end program

  
