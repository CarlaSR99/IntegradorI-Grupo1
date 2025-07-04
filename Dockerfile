FROM glassfish:latest

# Copia el archivo WAR generado a la carpeta de despliegue automático de GlassFish
COPY target/Integrador-WebEmpleaU-1.0-SNAPSHOT.war $GLASSFISH_HOME/glassfish/domains/domain1/autodeploy/ROOT.war
