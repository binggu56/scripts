       subroutine multi_polyfit(m,vx,vy,f,d,c)
!--------------------------------------------------
!      Polynomial fitting of data points 
!      m  : number of points
!      d  : degree of polynomials
c      c  : array of coefficients 
!-------------------------------------------------
       implicit real*8(a-h,o-z)
       integer, intent(in)         :: d,m
       real*8,dimension(d+1)       :: ipiv
       integer,dimension(d+1)              :: work
       real*8,dimension(m), intent(in) :: vx,vy,f
    
       real*8 :: X(m,d+1), XT(d+1,m), XTX(d+1,d+1), XTY(d+1)
       real*8 :: yy(d+1,d+1)
       integer :: i, j
       integer :: n, lda, lwork
       integer :: info
       real*8, intent(out) :: c(d+1)

    
       n = d+1
       lda = n
       lwork = n

!       allocate(ipiv(n))
!       allocate(work(lwork))
!       allocate(XT(n, size(vx)))
!       allocate(X(size(vx), n))
!       allocate(XTX(n, n))
    
       ! prepare the matrix
!       do i = 0, d
!          do j = 1, m
!             X(j, i+1) = vx(j)**i
!          end do
!       end do
       print *,f(1),f(2),f(3)
!       print *,vx(1),vx(2),vx(3)
!       print *,vy(1),vy(2),vy(3)

       do j=1,m
         X(j,1) = 1d0
         x(j,2) = vx(j)
         X(j,3) = vy(j)
         X(j,4) = vx(j)**2
         X(j,5) = vy(j)**2
         X(j,6) = vx(j)*vy(j)
       enddo

       XT  = transpose(X)
       XTX = matmul(XT, X)
       XTY = matmul(XT, F)

!     calls to LAPACK subs DGETRF and DGETRI
!       call DGETRF(n, n, XTX, lda, ipiv, info)
       call DPOSV('L', N, 1, XTX, LDA, XTY, N,INFO)
       print *,INFO
       if ( info /= 0 ) then
          print *, "problem"
          stop
       end if

!       print *,'X = ', X(1,1),x(1,2),x(1,3)
!       print *,'XT =', XT(1,1),xt(2,1),xt(3,1)
!       print *,size(XTX)
!       c = matmul(matmul(XTX, XT), f)
       c = XTY

       return 
       end subroutine
