! 程序目的：模拟运动过程中的科氏力
! 新知识点：数值模拟过程中的迭代技巧

program EX_04
    implicit none
    integer, parameter :: n = 3600
    real(kind=8) :: u, v, x, y, u_new, v_new, x_new, y_new, alpha, freq
    ! 定义常数：时间步长、重力加速度、物体密度
    real(kind=8), parameter :: delta_t = 24.d0 * 3600.d0 / 200.d0, PI = dacos(-1.d0)
    integer :: i

    freq = -2.d0 * PI / ( 24.d0 * 3600.d0 )
    alpha = delta_t * 2.d0 * freq

    u = 5.d-1
    v = 5.d-1
    x = 0.d0
    y = 5.d0

    open(11, file = 'data.txt', action = 'write')

    do i = 0, n - 1
        ! 基于先前值计算迭代后的新数值
        u_new = dcos(alpha) * u + dsin(alpha) * v
        v_new = dcos(alpha) * v - dsin(alpha) * u

        x_new = x + u_new * delta_t
        y_new = y + v_new * delta_t

        ! 计算完成后，再把值更新
        x = x_new
        y = y_new
        u = u_new
        v = v_new

        ! 输出至文件
        write(11, *) u, v, x, y

    end do

    close(11)

end
