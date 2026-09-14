document.addEventListener("DOMContentLoaded", () => {
    const reduced = window.matchMedia("(prefers-reduced-motion: reduce)").matches;
    const sfxKey = "retroSfx";

    function sfxEnabled() {
        return localStorage.getItem(sfxKey) !== "off" && !reduced;
    }

    function beep(freq = 660, duration = 0.06) {
        if (!sfxEnabled() || !window.AudioContext && !window.webkitAudioContext) {
            return;
        }
        try {
            const Ctx = window.AudioContext || window.webkitAudioContext;
            const ctx = beep._ctx || (beep._ctx = new Ctx());
            const osc = ctx.createOscillator();
            const gain = ctx.createGain();
            osc.type = "square";
            osc.frequency.value = freq;
            gain.gain.value = 0.04;
            osc.connect(gain);
            gain.connect(ctx.destination);
            osc.start();
            osc.stop(ctx.currentTime + duration);
        } catch (ignored) {
            /* audio opcional */
        }
    }

    document.querySelectorAll("button, .btn").forEach((el) => {
        el.addEventListener("click", () => beep(el.classList.contains("btn-danger") ? 220 : 780));
    });

    const toggle = document.getElementById("retroSfxToggle");
    if (toggle) {
        const sync = () => {
            const on = sfxEnabled();
            toggle.setAttribute("aria-pressed", String(on));
            toggle.textContent = on ? "SFX ON" : "SFX OFF";
        };
        sync();
        toggle.addEventListener("click", () => {
            localStorage.setItem(sfxKey, sfxEnabled() ? "off" : "on");
            sync();
            beep(520, 0.08);
        });
    }

    if (typeof window.mostrarAviso === "function") {
        const original = window.mostrarAviso;
        window.mostrarAviso = function (texto, tipo) {
            original(texto, tipo);
            const aviso = document.querySelector(".js-visual-alert");
            if (!aviso) {
                return;
            }
            aviso.style.borderRadius = "0";
            aviso.style.border = "2px solid " + (tipo === "error" ? "#ff4d6d" : "#39ff8f");
            aviso.style.fontFamily = '"VT323", monospace';
            aviso.style.fontSize = "1.15rem";
            aviso.style.background = "#12122a";
            aviso.style.color = "#f1f3ff";
            aviso.style.boxShadow = tipo === "error"
                ? "0 0 4px rgba(255,77,109,.9), 0 0 16px rgba(255,77,109,.35)"
                : "0 0 4px rgba(57,255,143,.9), 0 0 16px rgba(57,255,143,.35)";
        };
    }

    /* ---------------------------------------------------------------
       Todo lo siguiente es 100% decorativo (no altera funcionalidad):
       barra de carga superior + fondo de estrellas tipo arcade.
    --------------------------------------------------------------- */
    if (!document.querySelector(".retro-loadbar")) {
        const loadbar = document.createElement("div");
        loadbar.className = "retro-loadbar";
        loadbar.setAttribute("aria-hidden", "true");
        document.body.appendChild(loadbar);
    }

    if (!reduced) {
        iniciarFondoEstrellas();
    }

    function iniciarFondoEstrellas() {
        const canvas = document.createElement("canvas");
        canvas.setAttribute("aria-hidden", "true");
        Object.assign(canvas.style, {
            position: "fixed",
            inset: "0",
            width: "100%",
            height: "100%",
            zIndex: "-1",
            pointerEvents: "none"
        });
        document.body.appendChild(canvas);
        document.body.style.position = document.body.style.position || "relative";

        const ctx = canvas.getContext("2d");
        if (!ctx) {
            return;
        }

        let width, height, stars;

        function tamanio() {
            width = canvas.width = window.innerWidth;
            height = canvas.height = window.innerHeight;
            const total = Math.min(120, Math.floor((width * height) / 14000));
            stars = Array.from({ length: total }, () => ({
                x: Math.random() * width,
                y: Math.random() * height,
                r: Math.random() * 1.4 + 0.3,
                speed: Math.random() * 0.15 + 0.03,
                fase: Math.random() * Math.PI * 2
            }));
        }

        function dibujar(t) {
            ctx.clearRect(0, 0, width, height);
            stars.forEach((s) => {
                s.y += s.speed;
                if (s.y > height) {
                    s.y = 0;
                    s.x = Math.random() * width;
                }
                const brillo = 0.35 + 0.65 * Math.abs(Math.sin(t / 900 + s.fase));
                ctx.beginPath();
                ctx.fillStyle = "rgba(241, 243, 255, " + brillo.toFixed(2) + ")";
                ctx.arc(s.x, s.y, s.r, 0, Math.PI * 2);
                ctx.fill();
            });
            window.requestAnimationFrame(dibujar);
        }

        tamanio();
        window.addEventListener("resize", tamanio);
        window.requestAnimationFrame(dibujar);
    }
});
