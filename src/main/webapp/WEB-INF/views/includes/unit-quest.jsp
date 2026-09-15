<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:choose>
    <c:when test="${unidad.id == 1}">
        <c:set var="questUnitTitle" value="Fundamentos de la Arquitectura de Software y Estándares Internacionales"/>
        <c:set var="questUnitLore" value="STAGE I. Aquí se sientan las reglas del juego: qué es arquitectura, cómo se diferencia del diseño, qué atributos de calidad importan y qué estándares internacionales (ISO/IEC, IEEE) marcan el tablero. El objetivo es producir software con una base sólida, no con un prototipo suelto."/>
    </c:when>
    <c:when test="${unidad.id == 2}">
        <c:set var="questUnitTitle" value="Modelado de la Arquitectura de Software mediante Programación Orientada a Objetos"/>
        <c:set var="questUnitLore" value="STAGE II. La arquitectura se dibuja con POO: abstracción, encapsulamiento, herencia y polimorfismo como armas de diseño. Se modela con UML, se recortan componentes y capas, y se valida el modelo antes de entrar al dungeon de la implementación."/>
    </c:when>
    <c:when test="${unidad.id == 3}">
        <c:set var="questUnitTitle" value="Comunicación e Integración de Arquitecturas de Software"/>
        <c:set var="questUnitLore" value="STAGE III. Los sistemas dejan de ser islas. Se estudia cómo hablan las arquitecturas: síncrono y asíncrono, REST, mensajería, contratos de interfaz y validación de la comunicación. El loot es interoperabilidad real."/>
    </c:when>
    <c:otherwise>
        <c:set var="questUnitTitle" value="Frameworks y Estándares para la Implementación de Arquitecturas de Software"/>
        <c:set var="questUnitLore" value="STAGE IV. Se baja al metal con frameworks (Jakarta EE / Spring y similares), normas y buenas prácticas. La misión final: implementar la arquitectura elegida con un framework, medible y alineada a estándares."/>
    </c:otherwise>
</c:choose>
