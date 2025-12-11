#Requires AutoHotkey v2.0
#SingleInstance Force

Run("C:\Program Files\LosslessCut\LosslessCut.exe --keyboard-action concatBatch")
WinWaitActive("ahk_exe LosslessCut.exe")
Run("C:\Program Files\LosslessCut\LosslessCut.exe --keyboard-action concatBatch")
ProcessWaitClose("LosslessCut.exe")

; Try browsers in your preferred order
try {
    Run("brave.exe --incognito https://studio.youtube.com/channel/?d=ud")
} catch {
    try {
        Run("firefox.exe -private-window https://studio.youtube.com/channel/?d=ud")
    } catch {
        try {
            Run("msedge.exe --inprivate https://studio.youtube.com/channel/?d=ud")
        } catch {
            try {
                ; Fine, Chrome as last resort
                Run("chrome.exe --incognito https://studio.youtube.com/channel/?d=ud")
            } catch {
                ; Ultimate fallback
                Run("https://studio.youtube.com/channel/?d=ud")
            }
        }
    }
}

ExitApp()