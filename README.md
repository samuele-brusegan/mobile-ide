# 📱 Mobile IDE

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-3d46cc?style=for-the-badge&logo=flutter&logoColor=white)

Un IDE mobile leggero, potente e personalizzabile, progettato per permetterti di programmare ovunque ti trovi. Con un'interfaccia ispirata ai temi scuri di JetBrains, portiamo la potenza di un editor desktop sul tuo smartphone.

## ✨ Caratteristiche Principali

- 🚀 **Editor Avanzato:** Syntax highlighting, numeri di riga e supporto pinch-to-zoom per una lettura confortevole.
- 📂 **File Explorer Nativo:** Gestione completa dei file locali (creazione, modifica ed eliminazione) con supporto iniziale per `.txt`, `.py` e `.js`.
- ⌨️ **Accessory Bar Personalizzata:** Una barra tastiera dedicata con scorciatoie per i simboli di programmazione più comuni (`{`, `}`, `(`, `)`, `;`, ecc.).
- 🎨 **Design Premium:** Interfaccia ispirata all'estetica JetBrains Dark, basata su Material Design 3.
- 📱 **Multi-piattaforma:** Sviluppato con Flutter per funzionare fluidamente su Android e iOS (e potenzialmente desktop).
- 🏗️ **Architettura Robusta:** Stato gestito completamente con Riverpod e architettura a "Features" per una massima manutenibilità.

## 🛠️ Tech Stack

- **Framework:** [Flutter](https://flutter.dev)
- **State Management:** [Riverpod](https://riverpod.dev) (con Code Generation)
- **Editor Core:** [code_text_field](https://pub.dev/packages/code_text_field)
- **Typography:** [Google Fonts](https://pub.dev/packages/google_fonts)
- **Icons:** Material Design & Cupertino Icons

---

## 🚀 Guida all'Installazione

Segui questi passaggi per configurare ed eseguire il progetto sul tuo ambiente locale.

### Prerequisiti

Assicurati di avere installato:
- **Flutter SDK:** >= 3.0.0 ([Guida installazione](https://docs.flutter.dev/get-started/install))
- **Dart SDK:** Incluso in Flutter.
- Un emulatore o un dispositivo fisico connesso.

### Step 1: Clonare il Repository

```bash
git clone https://github.com/tuo-username/mobile-ide.git
cd mobile-ide
```

### Step 2: Installare le dipendenze

Dalla root del progetto, esegui:

```bash
flutter pub get
```

### Step 3: Generazione del codice

Il progetto utilizza `riverpod_generator` per la gestione dello stato. Genera i file necessari con:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Step 4: Eseguire l'applicazione

Infine, lancia l'app sul tuo dispositivo:

```bash
flutter run
```

---

## 📖 Come Usare l'App

1.  **Navigazione:** Usa il menu laterale o la barra di navigazione per switchare tra il **File Explorer** e l'**Editor**.
2.  **Esplorazione:** Nel File Explorer, puoi navigare tra le cartelle locali del dispositivo (previa concessione dei permessi).
3.  **Editor:** Clicca su un file supportato per aprirlo. Usa la barra sopra la tastiera per inserire velocemente i simboli speciali.
4.  **Zoom:** Puoi fare pinch-to-zoom nell'editor per ingrandire o rimpicciolire il font al volo.

## 🗺️ Prossimi Passi (Roadmap)

- [ ] Integrazione con Git (Clone, Pull, Push).
- [ ] Terminale integrato per linguaggi interpretati.
- [ ] Supporto a temi personalizzabili.
- [ ] Evidenziazione degli errori in tempo reale.
- [ ] Plugin system per estendere le funzionalità.

---

## 🤝 Contribuire

I contributi sono ciò che rendono la community open source un posto fantastico per imparare, ispirare e creare. Qualsiasi contributo tu dia è **molto apprezzato**.

1. Fai il Fork del progetto.
2. Crea il tuo Feature Branch (`git checkout -b feature/AmazingFeature`).
3. Fai il Commit delle tue modifiche (`git commit -m 'Add some AmazingFeature'`).
4. Fai il Push sul Branch (`git push origin feature/AmazingFeature`).
5. Apri una Pull Request.

---

## 📄 Licenza

Distribuito sotto Licenza MIT. Vedi `LICENSE` per maggiori informazioni.

---

Realizzato con ❤️ da [Il Tuo Nome/Team]
