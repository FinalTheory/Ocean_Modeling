! ********************����Ŀ��********************

! ģ��ӵ��е���������

! ********************��֪ʶ��********************

! 1. �ӳ���(subroutine)��ʹ�ã�
! 2. ģ��(module)��ʹ�ã�
! 3. Դ����ķָ�������
! 4. ���ļ����롣

program EX_05
    use iter
    implicit none
    call InitData
    open(11, file='output_eta.txt', form='formatted')
    open(12, file='output_u.txt', form='formatted')
    ! call SimulationCase_1
    call SimulationCase_2
    close(11)
    close(12)
end
