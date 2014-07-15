       subroutine polyfit(m,vx, vy, d,c)
!--------------------------------------------------
!      Polynomial fitting of data points 
!      m  : number of points
!      d  : degree of polynomials
c      c  : array of coefficients 
!-------------------------------------------------
       implicit real*8(a-h,o-z)
       integer, intent(in)         :: d,m
       real*8,dimension(d+1)       :: c
       integer :: ipiv(d+1)
       real,dimension(d+1)              :: work
       real*8,dimension(m), intent(in)    :: vx, vy
    
       real*8 :: X(m,d+1), XT(d+1,m), XTX(d+1,d+1),XTY(d+1)
    
       integer :: i, j
       integer :: n, lda, lwork
       integer :: info

    
       n = d+1
       lda = n
       lwork = n
    
!       allocate(ipiv(n))
!       allocate(work(lwork))
!       allocate(XT(n, size(vx)))
!       allocate(X(size(vx), n))
!       allocate(XTX(n, n))
    
       ! prepare the matrix
       do i = 0, d
          do j = 1, m
             X(j, i+1) = vx(j)**i
          end do
       end do
    
       XT  = transpose(X)
       XTX = matmul(XT, X)
       XTY = matmul(XT, vy)

       do i=1,n
         write(*,6000) (XTX(i,j),j=1,n)
       enddo
6000   format(20(f10.2,1x))
      
      print *,XTY
       ! calls to LAPACK subs DGETRF and DGETRI
!       call DGETRF(n, n, XTX, lda, ipiv, info)

      call DPOSV('L', N, 1, XTX, LDA, XTY, N,INFO)
       print *,INFO
       if ( info /= 0 ) then
          print *, "problem"
          return
       end if
       print *,'test' 
!       call DGETRI(n, XTX, lda, ipiv, work, lwork, info)
!       print *,INFO
!       if ( info /= 0 ) then
!          print *, "problem"
!          return
!       end if
!       print *,'test3'
      c = XTY 
!       c = matmul( matmul(XTX, XT), vy)
       
       return      
       end subroutine
