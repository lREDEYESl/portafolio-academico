document.addEventListener("DOMContentLoaded", () => {
    if (window.AOS) {
        AOS.init({
            duration: 700,
            easing: "ease-out",
            once: true,
            offset: 70
        });
    }

    document.querySelectorAll("form.js-visual-validate").forEach((form) => {
        form.addEventListener("submit", (event) => {
            if (!validarFormulario(form)) {
                event.preventDefault();
            }
        });

        form.querySelectorAll("input, textarea, select").forEach((campo) => {
            campo.addEventListener("blur", () => validarCampo(campo));
            campo.addEventListener("input", () => {
                if (campo.classList.contains("is-invalid") || campo.classList.contains("is-valid")) {
                    validarCampo(campo);
                }
            });
        });
    });

    document.querySelectorAll(".js-download").forEach((boton) => {
        boton.addEventListener("click", (event) => {
            const href = boton.getAttribute("href");
            if (!href || href === "#") {
                event.preventDefault();
                mostrarAviso("La descarga de archivos se habilitará en una fase posterior.", "info");
            }
        });
    });
});

function validarFormulario(form) {
    let valido = true;
    form.querySelectorAll("input, textarea, select").forEach((campo) => {
        if (!validarCampo(campo)) {
            valido = false;
        }
    });
    if (!valido) {
        mostrarAviso("Revisa los campos marcados antes de continuar.", "error");
    }
    return valido;
}

function validarCampo(campo) {
    const valor = (campo.value || "").trim();
    let mensaje = "";

    if (campo.hasAttribute("required") && valor === "") {
        mensaje = "Este campo es obligatorio.";
    } else if (campo.type === "email" && valor !== "" && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(valor)) {
        mensaje = "Ingresa un correo válido.";
    }

    toggleEstado(campo, mensaje);
    return mensaje === "";
}

function toggleEstado(campo, mensaje) {
    campo.classList.remove("is-valid", "is-invalid");
    let feedback = campo.parentElement.querySelector(".js-field-feedback");
    if (!feedback) {
        feedback = document.createElement("div");
        feedback.className = "js-field-feedback";
        campo.parentElement.appendChild(feedback);
    }

    if (mensaje) {
        campo.classList.add("is-invalid");
        feedback.textContent = mensaje;
        feedback.style.color = "#fca5a5";
        feedback.style.fontSize = "0.82rem";
        feedback.style.marginTop = "0.35rem";
    } else {
        campo.classList.add("is-valid");
        feedback.textContent = "";
    }
}

function mostrarAviso(texto, tipo) {
    let aviso = document.querySelector(".js-visual-alert");
    if (!aviso) {
        aviso = document.createElement("div");
        aviso.className = "js-visual-alert";
        aviso.setAttribute("role", "status");
        Object.assign(aviso.style, {
            position: "fixed",
            right: "1.2rem",
            bottom: "1.2rem",
            zIndex: "1080",
            maxWidth: "22rem",
            padding: "0.85rem 1rem",
            borderRadius: "0.85rem",
            color: "#e8eef7",
            boxShadow: "0 18px 50px rgba(2, 8, 23, 0.45)"
        });
        document.body.appendChild(aviso);
    }
    aviso.style.background = tipo === "error" ? "#7f1d1d" : "#1e3a8a";
    aviso.textContent = texto;
    aviso.style.display = "block";
    window.clearTimeout(mostrarAviso._timer);
    mostrarAviso._timer = window.setTimeout(() => {
        aviso.style.display = "none";
    }, 3200);
}
