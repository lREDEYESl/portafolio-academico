<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:choose>
    <c:when test="${semana.titulo == 'Semana 1' || semana.titulo == 'Semana 01'}">
        <c:set var="questWeekTitle" value="Introducción a la Arquitectura de Software"/>
        <c:set var="questWeekLore" value="Boot sequence del curso. Se define qué es arquitectura de software, por qué no es lo mismo que el diseño detallado y cuál es el rol del arquitecto frente a los objetivos de negocio. Se identifican los elementos que impactan calidad, costo y sostenibilidad del proyecto."/>
    </c:when>
    <c:when test="${semana.titulo == 'Semana 2' || semana.titulo == 'Semana 02'}">
        <c:set var="questWeekTitle" value="Principios, Atributos de Calidad y Estándares Internacionales"/>
        <c:set var="questWeekLore" value="Se cargan los atributos de calidad (rendimiento, seguridad, disponibilidad, mantenibilidad) con ISO/IEC 25010. Aparecen los trade-offs: no hay build perfecto, hay decisiones. Se revisan estándares internacionales aplicables al ciclo de vida."/>
    </c:when>
    <c:when test="${semana.titulo == 'Semana 3' || semana.titulo == 'Semana 03'}">
        <c:set var="questWeekTitle" value="Estilos y Patrones Arquitectónicos"/>
        <c:set var="questWeekLore" value="Mapa de estilos: monolito, cliente-servidor, orientado a eventos. Patrones estructurales: capas, MVC y hexagonal (puertos y adaptadores). Se practican criterios para elegir el estilo según requerimientos, no según moda."/>
    </c:when>
    <c:when test="${semana.titulo == 'Semana 4' || semana.titulo == 'Semana 04'}">
        <c:set var="questWeekTitle" value="Documentación y Representación Arquitectónica"/>
        <c:set var="questWeekLore" value="Cómo se documenta una arquitectura para que otro jugador pueda leerla. Modelo 4+1 de Kruchten, modelo C4 y ADRs. UML deja de ser adorno: justifica decisiones y deja evidencia revisable."/>
    </c:when>
    <c:when test="${semana.titulo == 'Semana 5' || semana.titulo == 'Semana 05'}">
        <c:set var="questWeekTitle" value="Principios de POO aplicados a la Arquitectura de Software"/>
        <c:set var="questWeekLore" value="POO a escala de componentes: abstracción y encapsulamiento en los límites del sistema. Herencia y polimorfismo para bajar acoplamiento. Se construye un modelo coherente a partir de requisitos funcionales."/>
    </c:when>
    <c:when test="${semana.titulo == 'Semana 6' || semana.titulo == 'Semana 06'}">
        <c:set var="questWeekTitle" value="Modelado Arquitectónico con UML"/>
        <c:set var="questWeekLore" value="Laboratorio UML: diagramas de clases y paquetes para la estructura; casos de uso y secuencia para el comportamiento. La regla: el modelo debe alinearse con la arquitectura propuesta, no contradecirla."/>
    </c:when>
    <c:when test="${semana.titulo == 'Semana 7' || semana.titulo == 'Semana 07'}">
        <c:set var="questWeekTitle" value="Diseño de Componentes y Capas de la Arquitectura"/>
        <c:set var="questWeekLore" value="Se recortan módulos, responsabilidades y contratos. Capas lógicas: presentación, negocio y persistencia. Se evalúa cohesión alta y acoplamiento bajo como métricas de un buen save."/>
    </c:when>
    <c:when test="${semana.titulo == 'Semana 8' || semana.titulo == 'Semana 08'}">
        <c:set var="questWeekTitle" value="Elaboración y Validación del Modelo Arquitectónico"/>
        <c:set var="questWeekLore" value="Checkpoint de la Unidad II. Se integran artefactos OO, se valida con enfoques tipo ATAM y se sustenta técnicamente cada decisión. Si el modelo no aguanta la revisión, se itera antes de codear."/>
    </c:when>
    <c:when test="${semana.titulo == 'Semana 9' || semana.titulo == 'Semana 09'}">
        <c:set var="questWeekTitle" value="Fundamentos de la Comunicación entre Arquitecturas de Software"/>
        <c:set var="questWeekLore" value="Cómo se hablan los componentes: síncrono vs asíncrono. Protocolos HTTP/REST, gRPC y WebSockets. Se diseñan flujos de información para sistemas distribuidos sin romper la latencia ni el contrato."/>
    </c:when>
    <c:when test="${semana.titulo == 'Semana 10'}">
        <c:set var="questWeekTitle" value="Métodos y Tecnologías para la Integración de Sistemas"/>
        <c:set var="questWeekLore" value="Patrones de integración e interoperabilidad. APIs REST, servicios web y colas (RabbitMQ/Kafka). Se elige el método según requerimientos no funcionales, no según el tutorial más corto."/>
    </c:when>
    <c:when test="${semana.titulo == 'Semana 11'}">
        <c:set var="questWeekTitle" value="Diseño de Interfaces y Transmisión de Datos"/>
        <c:set var="questWeekLore" value="El contrato es ley: diseño de APIs, versionamiento y seguridad. JSON, XML y Protocol Buffers como formatos de transmisión. La interoperabilidad se demuestra con datos que cruzan subsistemas sin perder integridad."/>
    </c:when>
    <c:when test="${semana.titulo == 'Semana 12'}">
        <c:set var="questWeekTitle" value="Implementación y Validación de la Comunicación Arquitectónica"/>
        <c:set var="questWeekLore" value="Se implementan las interfaces definidas y se prueban. Integración, disponibilidad, tolerancia a fallos y carga. Si el canal se cae, el diseño tiene que tener plan B."/>
    </c:when>
    <c:when test="${semana.titulo == 'Semana 13'}">
        <c:set var="questWeekTitle" value="Fundamentos de Frameworks de Arquitectura de Software"/>
        <c:set var="questWeekLore" value="Qué aporta un framework: IoC, inyección de dependencias y estructura. Comparativa de entornos (Spring Boot, Jakarta EE) y cómo el framework debe servir a los requisitos, no al revés."/>
    </c:when>
    <c:when test="${semana.titulo == 'Semana 14'}">
        <c:set var="questWeekTitle" value="Normas y Buenas Prácticas en Arquitectura de Software"/>
        <c:set var="questWeekLore" value="Patrones GoF, Clean Code y Secure by Design. Criterios de calidad: escalabilidad, seguridad y rendimiento. La selección tecnológica se justifica con el contexto de despliegue."/>
    </c:when>
    <c:when test="${semana.titulo == 'Semana 15'}">
        <c:set var="questWeekTitle" value="Implementación de la Arquitectura utilizando Frameworks"/>
        <c:set var="questWeekLore" value="Boss final. Se ensamblan patrones, comunicación y principios. Se despliega con el framework elegido y se evalúa con métricas de calidad. El portafolio debe demostrar que la arquitectura corre, no solo que se dibujó."/>
    </c:when>
    <c:otherwise>
        <c:set var="questWeekTitle" value="${semana.titulo}"/>
        <c:set var="questWeekLore" value="${semana.contenido}"/>
    </c:otherwise>
</c:choose>
