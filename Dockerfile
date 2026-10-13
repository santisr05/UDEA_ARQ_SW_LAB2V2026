# ==========================================
# Etapa 1: Construcción de la aplicación
# ==========================================
FROM maven:3.9.11-eclipse-temurin-17 AS build

WORKDIR /app

# Copiar el código fuente
COPY . .

# Compilar y empaquetar la aplicación
RUN mvn clean package -DskipTests

# ==========================================
# Etapa 2: Ejecución de la aplicación
# ==========================================
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

# Copiar el JAR generado en la etapa de construcción
COPY --from=build /app/target/UDEA_ARQ_SW_LAB2V2026.jar UDEA_ARQ_SW_LAB2V2026.jar

# Puerto de la aplicación
EXPOSE 8080

# Ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "UDEA_ARQ_SW_LAB2V2026.jar"]