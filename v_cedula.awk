#! /usr/bin/awk -f
BEGIN{
}
!/^#/{
       cedula=$1        
       suma=0
       for (i =1 ; i < 10; i+=2){
                n_ced = substr(cedula, i, 1)*2 
                if (n_ced < 10){
                        suma += n_ced
                }else{ 
                        suma  += n_ced-9
                }       
        } 
        
        for ( j = 2; j < 10; j+=2 ){
                n_ced = substr(cedula, j, 1)
                suma += n_ced
        } 
      
        udigito_cedula = substr(cedula, 10,1)
        udigito_suma = substr(suma, 2, 1)
        
        if (udigito_cedula != 0){
                ld = 10 - udigito_cedula      
        }
        if (ld == udigito_suma){
                printf("True")
        }else{
                printf("False")
        }

}
