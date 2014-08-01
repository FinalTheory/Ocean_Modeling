! ********************程序目的********************

! 模拟河道中的重力长波

! ********************新知识点********************

! 1. 子程序(subroutine)的使用；
! 2. 模块(module)的使用；
! 3. 源代码的分割与整理；
! 4. 多文件编译。

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
