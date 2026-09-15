document.addEventListener("DOMContentLoaded", () => {
    const sidebar = document.getElementById("rpgSidebar");
    const toggle = document.getElementById("rpgSidebarToggle");
    const backdrop = document.getElementById("rpgSidebarBackdrop");
    const dockToggle = document.getElementById("rpgDockToggle");

    function setSidebar(open) {
        if (!sidebar) {
            return;
        }
        sidebar.classList.toggle("is-open", open);
        if (toggle) {
            toggle.setAttribute("aria-expanded", String(open));
        }
        if (dockToggle) {
            dockToggle.setAttribute("aria-expanded", String(open));
        }
        if (backdrop) {
            backdrop.hidden = !open;
        }
        document.body.style.overflow = open && window.matchMedia("(max-width: 991.98px)").matches
            ? "hidden"
            : "";
    }

    function toggleSidebar() {
        setSidebar(!sidebar.classList.contains("is-open"));
    }

    if (sidebar && toggle) {
        toggle.addEventListener("click", toggleSidebar);
        if (dockToggle) {
            dockToggle.addEventListener("click", toggleSidebar);
        }
        if (backdrop) {
            backdrop.addEventListener("click", () => setSidebar(false));
        }
        document.addEventListener("keydown", (event) => {
            if (event.key === "Escape") {
                setSidebar(false);
            }
        });
        window.addEventListener("resize", () => {
            if (window.matchMedia("(min-width: 992px)").matches) {
                setSidebar(false);
            }
        });
    }

    function lightbox() {
        let dialog = document.getElementById("cyberLightbox");
        if (!dialog) {
            dialog = document.createElement("dialog");
            dialog.id = "cyberLightbox";
            dialog.className = "cyber-lightbox";
            dialog.innerHTML =
                '<img alt="Vista previa del archivo">' +
                '<div class="cyber-lightbox-bar">' +
                '<span>SCANNER // FULL SCREEN</span>' +
                '<button type="button" class="cyber-lightbox-close" data-lightbox-close>Cerrar</button>' +
                "</div>";
            document.body.appendChild(dialog);
        }
        const img = dialog.querySelector("img");
        const closeBtn = dialog.querySelector("[data-lightbox-close]");

        function open(src, alt) {
            img.src = src;
            img.alt = alt || "Vista previa";
            if (typeof dialog.showModal === "function") {
                dialog.showModal();
            }
        }

        function close() {
            if (dialog.open) {
                dialog.close();
            }
            img.removeAttribute("src");
        }

        closeBtn.addEventListener("click", close);
        dialog.addEventListener("click", (event) => {
            if (event.target === dialog) {
                close();
            }
        });

        document.querySelectorAll("[data-lightbox]").forEach((el) => {
            el.addEventListener("click", (event) => {
                event.preventDefault();
                const src = el.getAttribute("data-lightbox");
                if (!src) {
                    return;
                }
                const alt = el.getAttribute("data-lightbox-alt") || "";
                const isImage = /\.(png|jpe?g|gif|webp)(\?|#|$)/i.test(src);
                if (!isImage) {
                    window.open(src, "_blank", "noopener");
                    return;
                }
                open(src, alt);
            });
        });
    }

    lightbox();
});
