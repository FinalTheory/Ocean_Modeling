! 本次编程练习的知识点：
! 1. 使用dimension语法声明数组
! 2. 自定义数组下标
! 3. 循环的使用
! 4. 双精度浮点数的使用及要点
! 5. 数据的输出

program EX_01
    implicit none
    integer, parameter :: n = 15
    real(kind=8), dimension(0:n) :: C1, C2, C3
    ! 取时间步长3600s，即1个小时
    ! 这里面的alpha就是我们所采用的半隐半显系数
    real(kind=8), parameter :: delta_t = 3600.d0, kappa = 1d-4, alpha = 0.5
    integer :: i

    C1(0) = 100.d0
    C2(0) = 100.d0
    C3(0) = 100.d0

    do i = 0, n - 1
        C1(i + 1) = C1(i) * ( 1.d0 - delta_t * kappa )
        C2(i + 1) = C2(i) / ( 1.d0 + delta_t * kappa )
        C3(i + 1) = C2(i) * ( 1.d0 / delta_t - (1 - alpha) * kappa ) / ( 1 / delta_t + alpha * kappa )
    end do

    open(11, file = 'explicit.txt', action = 'write')
    open(12, file = 'implicit.txt', action = 'write')
    open(13, file = 'semi-implicit.txt', action = 'write')
    write(11, *) C1
    write(12, *) C2
    write(13, *) C3
    close(11)
    close(12)
    close(13)
end
