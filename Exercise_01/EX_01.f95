! ���α����ϰ��֪ʶ�㣺
! 1. ʹ��dimension�﷨��������
! 2. �Զ��������±�
! 3. ѭ����ʹ��
! 4. ˫���ȸ�������ʹ�ü�Ҫ��
! 5. ���ݵ����

program EX_01
    implicit none
    integer, parameter :: n = 15
    real(kind=8), dimension(0:n) :: C1, C2, C3
    ! ȡʱ�䲽��3600s����1��Сʱ
    ! �������alpha�������������õİ�������ϵ��
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
