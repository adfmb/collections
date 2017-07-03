# O O J O O:
## PARA EJECUTAR LA APP:
## - selecciona este script completo (Ctrl + A) y
## - presiona: Ctrl + Enter

### Si quieres ver paso a paso qué hace cada parte del código dale una leída
### a las líneas comentadas



##### Para poder lanzar la app desde tu compu necesitamos que se tenga instalada
##### la paquetería de shiny.
##### Para que no se sobreinstalé la paquetería en caso de ya tenerla, hacemos
##### una serie de consultas a los paquetes instalados en la compu para decidir
##### si se instala o si no es necesario pues ya se cuenta con ella.

##### Aquí creamos unas tablas con el listado de todos los paquetes de R
##### que tienes instalados en tu compu
x<-installed.packages()
y<-as.data.frame(x)

######

###### Aquí le preguntas a tu máquina si entre esos paquetes que ya tienes instalados
###### tienes el de Shiny. 
###### La instrucción > "shiny"%in%y$Package < literal es preguntar si la palabra
##### "shiny" está dentro de las palabras que están en la lista de paquetes instalados.
##### Esa instrucción devuelve TRUE y FALSE. 
##### Si te fijas bien, antes de la instrucción hay un signo de admiración (!)
##### El cuál contradice todo lo que sigue después del mismo.
##### Es decir, si después del signo hay un TRUE, lo convierte en FALSE
##### Y si después del signo hay un FALSE, va a devolver un TRUE
##### Entonces si la palabra "shiny" está dentro de la lista de paquetes
##### La instrucción "shiny"%in%y$Package va a devolver TRUE y el signo de adm (!)
##### Lo convertirá en FALSE y ya no ejecutará las instrucción que tiene el "if".
##### En caso en el que la instrucción "shiny"%in%y$Package devuelva FALSE,
##### querrá decir que no se tiene instalada esa paquetería dentro de la compu
##### y el signo de admiración (!) convertirá ese FALSE en TRUE y entonces sí
##### ejecutará lo que está dentro del if que es justo la instalación de ese paquete
##### que ya se comprobó que no se tiene


if(!"shiny"%in%y$Package){
  install.packages("shiny")
}
## Carga las funciones de la paquetería de Shiny
library(shiny)
## Lanza la App
runApp(".")
