! 程序目的：模拟物体在海水中的上下震动

program EX_03
    implicit none
    integer, parameter :: n = 3600
    real(kind=8) :: rho_amp
    ! 定义深度以及纵向速度
    real(kind=8), dimension(0:n) :: z, w
    ! 定义常数：时间步长、重力加速度、物体密度
    real(kind=8), parameter :: delta_t = 1.d0, g = 9.8d0, rho_obj = 1025.5d0, alpha = 0.01d0, R = 2.d-3
    integer :: i

    z(0) = -80.d0
    w(0) =   0.d0

    do i = 0, n - 1
        rho_amp = 1025.d0 - z(i) * alpha
        w(i + 1) = ( w(i) - delta_t * g * ( rho_obj - rho_amp ) / rho_obj ) / ( 1 + R * delta_t )
        z(i + 1) = z(i) + delta_t * w(i + 1)
    end do

    open(11, file = 'z.txt', action = 'write')
    open(12, file = 'w.txt', action = 'write')
    write(11, *) z
    write(12, *) w
    close(11)
    close(12)
end
