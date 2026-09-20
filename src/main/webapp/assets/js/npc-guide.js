(function () {
    const GREETING = "¡Hola, Jugador! Soy tu guía en este sistema. ¿A dónde quieres viajar?";
    const ABOUT_ROGGER =
        "Rogger Palma es estudiante de Ingeniería de Sistemas. Especialista en redes, software y arquitectura. Te teletransporto al inicio...";

    const datosCuriosos = [
        "¿Sabías que el primer virus informático fue creado en 1971 y se llamaba Creeper? No te preocupes, este servidor está limpio.",
        "Dato de ingeniería: Una interrupción de división por cero (INT 00H) en Assembly puede hacer colapsar un sistema si no se maneja bien. ¡Escribir en bajo nivel es un arte!",
        "La arquitectura de este portafolio es tan sólida como un bloque de obsidiana. Nada de bugs por aquí.",
        "¿Sabías que un Goldfish bien cuidado en un acuario adecuado puede vivir más de 10 años? ¡El cuidado de peces es como mantener un servidor Linux en óptimas condiciones!",
        "Si te encuentras un Porygon-Z, ten cuidado, ¡su código está corrupto! A diferencia del código de esta aplicación.",
        "El backend de esta web funciona maravillosamente, pero en mi tiempo libre prefiero compilar cosas desde CachyOS."
    ];

    const ESCANEO = [
        "Iniciando escaneo de red...",
        "Ping a servidores Cisco Packet Tracer... OK.",
        "Verificando defensas contra SQL Injection... BLOQUEADO.",
        "Estado del sistema: 100% ÓPTIMO. Eres un administrador nivel Leyenda."
    ];

    document.addEventListener("DOMContentLoaded", () => {
        const root = document.getElementById("npcGuide");
        const avatar = document.getElementById("npcAvatar");
        const panel = document.getElementById("npcPanel");
        const speech = document.getElementById("npcSpeech");
        const menuMain = document.getElementById("npcMenuMain");
        const menuBack = document.getElementById("npcMenuBack");
        if (!root || !avatar || !panel || !speech || !menuMain || !menuBack) {
            return;
        }

        const ctx = root.getAttribute("data-ctx") || "";
        const reduced = window.matchMedia("(prefers-reduced-motion: reduce)").matches;
        let typeTimer = 0;
        let travelTimer = 0;
        let waitTimer = 0;
        let runId = 0;

        function stopAll() {
            runId += 1;
            window.clearTimeout(typeTimer);
            window.clearTimeout(travelTimer);
            window.clearTimeout(waitTimer);
        }

        function wait(ms) {
            return new Promise((resolve) => {
                waitTimer = window.setTimeout(resolve, ms);
            });
        }

        function typewrite(text) {
            window.clearTimeout(typeTimer);
            speech.textContent = "";
            speech.classList.add("is-typing");
            if (reduced) {
                speech.textContent = text;
                speech.classList.remove("is-typing");
                return Promise.resolve();
            }
            return new Promise((resolve) => {
                let i = 0;
                const tick = () => {
                    if (i < text.length) {
                        speech.textContent += text.charAt(i);
                        i += 1;
                        typeTimer = window.setTimeout(tick, 28);
                    } else {
                        speech.classList.remove("is-typing");
                        resolve();
                    }
                };
                tick();
            });
        }

        function showMainMenu() {
            menuMain.hidden = false;
            menuBack.hidden = true;
        }

        function showBackMenu() {
            menuMain.hidden = true;
            menuBack.hidden = false;
        }

        function hideMenus() {
            menuMain.hidden = true;
            menuBack.hidden = true;
        }

        function openPanel() {
            stopAll();
            showMainMenu();
            panel.hidden = false;
            panel.setAttribute("aria-hidden", "false");
            avatar.setAttribute("aria-expanded", "true");
            root.classList.add("is-open");
            typewrite(GREETING);
        }

        function closePanel() {
            stopAll();
            showMainMenu();
            panel.hidden = true;
            panel.setAttribute("aria-hidden", "true");
            avatar.setAttribute("aria-expanded", "false");
            root.classList.remove("is-open");
        }

        function travel(path) {
            window.location.href = ctx + path;
        }

        function datoCurioso() {
            const frase = datosCuriosos[Math.floor(Math.random() * datosCuriosos.length)];
            const token = runId;
            hideMenus();
            typewrite(frase).then(() => {
                if (token === runId) {
                    showBackMenu();
                }
            });
        }

        async function escanearSistema() {
            const token = runId;
            hideMenus();
            for (let i = 0; i < ESCANEO.length; i += 1) {
                if (token !== runId) {
                    return;
                }
                await typewrite(ESCANEO[i]);
                if (token !== runId) {
                    return;
                }
                if (i < ESCANEO.length - 1) {
                    await wait(1000);
                }
            }
            if (token === runId) {
                showBackMenu();
            }
        }

        avatar.addEventListener("click", () => {
            if (root.classList.contains("is-open")) {
                closePanel();
            } else {
                openPanel();
            }
        });

        panel.addEventListener("click", (event) => {
            const button = event.target.closest("[data-npc-action]");
            if (!button) {
                return;
            }
            const action = button.getAttribute("data-npc-action");
            if (action === "unidades") {
                travel("/unidades");
            } else if (action === "archivos") {
                travel("/admin/archivos");
            } else if (action === "sobre") {
                typewrite(ABOUT_ROGGER).then(() => {
                    travelTimer = window.setTimeout(() => travel("/#sobre-mi"), 900);
                });
            } else if (action === "curioso") {
                stopAll();
                datoCurioso();
            } else if (action === "escanear") {
                stopAll();
                escanearSistema();
            } else if (action === "contacto") {
                typewrite("Abriendo canales de comunicación cifrados... Te he desplazado a mi tarjeta de contacto.").then(() => {
                    const target = document.getElementById("contacto");
                    if (target) {
                        target.scrollIntoView({ behavior: "smooth" });
                    } else {
                        travel("/#contacto");
                    }
                });
            } else if (action === "volver") {
                stopAll();
                showMainMenu();
                typewrite(GREETING);
            } else if (action === "cerrar") {
                closePanel();
            }
        });
    });
})();
