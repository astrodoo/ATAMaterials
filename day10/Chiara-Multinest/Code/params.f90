
module params
implicit none


      	!max no. of iterations, a non-positive value means infinity. MultiNest will terminate if either it 
	!has done max no. of iterations or convergence criterion (defined through nest_tol) has been satisfied
      	integer nest_maxIter
      	parameter(nest_maxIter=000)
	




	!dimensionality
      	integer sdim
      	parameter(sdim=4)
      
      	!priors on the parameters
      	!uniform priors (min,max) are used for all dimensions & are set in main.f90
      	double precision spriorran(sdim,2)
      
! Parameters for MultiNest
	
      	!whether to do use Nested Importance Sampling
	logical nest_IS
 	parameter(nest_IS=.false.)
	
      	!whether to do multimodal sampling
	logical nest_mmodal 
 	parameter(nest_mmodal=.false.)
	
      	!sample with constant efficiency
	logical nest_ceff
 	parameter(nest_ceff=.false.)
	
      	!max no. of live points
      	integer nest_nlive
	parameter(nest_nlive=100)
      
      	!tot no. of parameters, should be sdim in most cases but if you need to
      	!store some additional parameters with the actual parameters then
      	!you need to pass them through the likelihood routine
	integer nest_nPar 
	parameter(nest_nPar=sdim)
      
      	!seed for MultiNest, -ve means take it from sys clock
	integer nest_rseed 
	parameter(nest_rseed=-1)
      
      	!evidence tolerance factor
      	double precision nest_tol 
!     	parameter(nest_tol=1.0d-2)
      	parameter(nest_tol=tiny(1.0d0))
      
      	!enlargement factor reduction parameter
      	double precision nest_efr
      	parameter(nest_efr=0.5d0)
      
      	!root for saving posterior files
      	character*100 nest_root
	parameter(nest_root='Chains/grmhd-')
	
	!after how many iterations feedback is required & the output files should be updated
	!note: posterior files are updated & dumper routine is called after every updInt*10 iterations
	integer nest_updInt
	parameter(nest_updInt=5)
	
	!null evidence (set it to very high negative no. if null evidence is unknown)
	double precision nest_Ztol
	parameter(nest_Ztol=-huge(1.d0))
      
      	!max modes expected, for memory allocation
      	integer nest_maxModes 
      	parameter(nest_maxModes=1)
      
      	!no. of parameters to cluster (for mode detection)
      	integer nest_nClsPar
      	parameter(nest_nClsPar=4)
      
      	!whether to resume from a previous run
      	logical nest_resume
!     	parameter(nest_resume=.false.)
      	parameter(nest_resume=.true.)
      
      	!whether to write output files
      	logical nest_outfile
      	parameter(nest_outfile=.true.)
      
      	!initialize MPI routines?, relevant only if compiling with MPI
	!set it to F if you want your main program to handle MPI initialization
      	logical nest_initMPI
      	parameter(nest_initMPI=.true.)
      
      	!points with loglike < nest_logZero will be ignored by MultiNest
      	double precision nest_logZero
!      	parameter(nest_logZero=-huge(1d0))
       	parameter(nest_logZero=-1.0d0)
      
	!parameters to wrap around (0 is F & non-zero T)
	integer nest_pWrap(sdim)
	
      	!feedback on the sampling progress?
      	logical nest_fb 
      	parameter(nest_fb=.true.)
!=======================================================================


end module params
