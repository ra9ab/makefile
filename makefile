vpath %.c ./Src
#variables
cc = gcc
src = ./Src
Inc = ./Inc
Deps = Dependencies/
QUIZ=./objfiles/Ehab_Ragab_MostafaMohamedMohamed_AhmedMohamedIbrahim.o
link_target = app.exe


#gathering all .c files
Source_files = $(subst $(src)/,,$(wildcard $(src)/*.c))
#gathering all .o files
Object_files = $(Source_files:.c=.o)

#denpendency files for each .c file 
Dependencies_filesA= $(Source_files:.c=.d)
Dependencies_filesB = $(addprefix $(Deps)/,$(Dependencies_filesA))

#clean all files after = 
Clean_files = $(Object_files) $(link_target) $(Dependencies_filesB)




#denpending header files 
-include $(Dependencies_filesB)



#Clean Target 
clean :
	del $(Clean_files)

#Compilation
%.o : %.c
	$(cc) -c -I$(Inc) $< -o $@
	$(cc) -MM -I$(Inc) $< > $(Deps)\$*.d

#Linking
$(link_target) : $(Object_files) $(QUIZ) 
	$(cc) $^ -o $@
#ALL target
all : $(link_target)