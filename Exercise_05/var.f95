module Var
    implicit none
    ! 空间步数、时间步数、中间位置
    integer, parameter :: numX = 101, numSteps = 2000, midX = ( numX - 1 ) / 2 + 1
    ! 常数定义
    real(kind=8), parameter :: &
    ! 时间、空间步长
    delta_x = 10.d0, delta_t = 1.d-1, &
    ! 滤波参数、重力加速度、圆周率
    eps = 5.d-2, g = 9.8d0, PI = dacos(-1.d0), &
    ! 中心扰动的周期、振幅
    period = 20.d0, amplitude = 1.d0
    ! 定义水平流速、水位、水深等
    real(kind=8), dimension(0:numX + 1) :: u, eta, u_new, eta_new, h, h_0

    contains

    subroutine InitData
        implicit none
        u = 0.d0
        u_new = 0.d0
        h_0 = 10.d0
        h_0(0) = 0.d0
        h_0(numX + 1) = 0.d0
        eta = 0.d0
        eta_new = 0.d0
        h = h_0 + eta
    end subroutine

    subroutine outputData
        implicit none
        write(11, *) eta
        write(12, *) u
    end subroutine

end module
