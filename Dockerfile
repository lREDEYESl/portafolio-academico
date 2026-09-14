# Etapa 1: Compilar el código usando Maven y Java 21
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Etapa 2: Configurar el servidor Tomcat 10.1 para Producción
FROM tomcat:10.1-jdk21

# Limpiar las aplicaciones por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copiar tu archivo .war compilado en la Etapa 1
# Lo renombramos a ROOT.war para que la app cargue en la URL principal (sin /portafolio-academico)
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Exponer el puerto por el que Tomcat se comunica
EXPOSE 8080

# Comando para iniciar Tomcat
CMD ["catalina.sh", "run"]