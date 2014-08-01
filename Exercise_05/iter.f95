module iter
    use Var
    implicit none
    integer :: n, k

    contains

    subroutine Calc_U
        implicit none
        do k = 1, numX
            if ( h(k + 1) > 0 ) u_new(k) = u(k) - delta_t * g * ( eta(k + 1) - eta(k) ) / delta_x
        end do
    end subroutine

    subroutine Calc_eta
        implicit none
        do k = 1, numX
            eta_new(k) = eta(k) - delta_t * ( &
            h(k) * ( u_new(k) + dabs(u_new(k)) ) * 0.5d0 - &
            h(k) * ( u_new(k - 1) - dabs(u_new(k - 1)) ) * 0.5d0 + &
            h(k + 1) * ( u_new(k) - dabs(u_new(k)) ) * 0.5d0 - &
            h(k - 1) * ( u_new(k - 1) + dabs(u_new(k - 1)) ) * 0.5d0 ) / delta_x
        end do
    end subroutine

    subroutine Shapiro_Filter
        implicit none
        do k = 1, numX
            eta(k) = ( 1 - eps ) * eta_new(k) + 0.5d0 * eps * ( eta_new(k - 1) + eta_new(k + 1) )
        end do
    end subroutine

    subroutine SimulationCase_1
        implicit none
        real(kind=8), dimension(0:numSteps) :: eta_mid

        ! 预先计算出中间振动位置的所有时刻水位
        do n = 0, numSteps
            eta_mid(n) = amplitude * dcos(dble(n * delta_t) * 2 * PI / period)
        end do

        eta(midX) = eta_mid(0)

        call outputData

        ! 开始迭代计算
        do n = 0, numSteps - 1

            ! 首先计算下一时刻所有点的水平流速
            call Calc_U
            ! 然后更新
            call Calc_eta
            ! 最后计算新的水位
            call Shapiro_Filter
            ! 用振动水位替换计算值
            eta(midX) = eta_mid(n + 1)
            ! 迭代更新
            u = u_new
            h = eta + h_0
            ! 输出数据
            call outputData

        end do

    end subroutine

    subroutine SimulationCase_2
        implicit none

        eta(midX - 5:midX + 5) = 1.d0
        h = eta + h_0

        call outputData

        ! 开始迭代计算
        do n = 0, numSteps - 1

            ! 首先计算下一时刻所有点的水平流速
            call Calc_U
            ! 然后更新中间变量
            call Calc_eta
            ! 最后计算新的水位
            call Shapiro_Filter
            ! 迭代更新
            u = u_new
            h = eta + h_0
            ! 输出数据
            call outputData

        end do
    end subroutine

end module
