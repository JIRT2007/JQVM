# JIRT QEMU VIRTUAL MACHINE
**JQVM** es una utilidad de terminal desarrollada por **JIRT2007** con el objetivo de ofrecer la posibilidad de simplificar el manejo del hypervisor **KVM/QEMU** en el ecosistema **GNU/Linux** mediante la ejecución de un simple script de shell. El mismo código esta desarrollado en Shell Script con la finalidad de priorizar la eficiencia, estabilidad y la auditabilidad, se destina su uso exclusivamente a sistemas del ecosistema **GNU/Linux** y sus familias (Debian, ArchLinux, RHEL, Slackware, Gentoo, etc).

## Características:
- **JQVM** se encuentra programado íntegramente en el lenguaje del paradigma imperativo **Shell Script** y se define enteramente en un único archivo de programación, esto con el objetivo de simplificar su manejo y no mantener varios scripts que puedan dificultar el trabajo tanto de los desarrolladores como de los usuarios. **JQVM** adopta, por principio filosoficos y de diseño una arquitectura monolítica (Un único archivo de script que define toda la lógica de programación) sumado a consistencias con los estandares **POSIX** para poder ser empleado en todo tipo de sistemas **GNU/Linux** y shells (Bash, Dash, Zsh, etc).
- **JQVM** es un proyecto de carácter académico y no busca la creación de nuevas tecnologías, simplemente facilitar el manejo de las mismas que implementa.
- Se recomienda su uso para sistemas operativos **GNU/Linux** y derivados con arquitectura **x86_64**.

## Instalación y recomendaciones: 
### Clonado del repositorio y alias:
- Instalar el programa GIT:         `sudo apt install git`
- Configurar usuario:               `git config --global user.name "Nombre de usuario de GIT"`
- Configurar correo electrónico:    `git config --global user.email "Correo de GIT"`
- Clonar repositorio:               `git clone https://github.com/JIRT2007/JQVM.git`

Se recomienda para facilitar el uso del script el convertirlo en un alias para poder ejecutarlo como comando en su respectiva terminal de comandos. Esto se puede hacer editando el archivo `.bashrc` (o el respectivo de su shell) y colocar al final del mismo un alias del estilo `alias jqvm='.~/JQVM/jqvm.sh'`.

## Licencias y alojamiento:
El código de **JQVM** se encuentra actualmente alojado dentro de un repositorio de la plataforma **GitHub** y se respalda tras la certificación de **General Public License v2.0** (**GPL v2.0**) cuyas especificaciones podrán encontrarse en la respectiva web del proyecto **GNU** al igual que en el archivo *LICENSE* dentro de este mismo repositorio.

**https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html**

## Autor: 
**JIRT2007** es el desarrollador y mantenedor principal del proyecto **JQVM** al igual que de proyectos como **CentrixCL** del cual se podrá encontrar información en su respectiva web alojada en GitHub Pages: **https://jirt2007.github.io/webCENTRIX/**
