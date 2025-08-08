use anyhow::Result;

/// Trait for PTY (pseudo terminal) abstraction
pub trait Pty: Send + Sync {
    fn read(&self, buf: &mut [u8]) -> Result<usize>;
    fn write(&self, data: &[u8]) -> Result<usize>;
    fn set_window_size(&self, size: &TerminalSize) -> Result<()>;
}

/// Trait for DataChannel abstraction
pub trait DataChannel: Send + Sync {
    fn send(&self, data: &[u8]) -> Result<()>;
    fn close(&self) -> Result<()>;
    fn id(&self) -> u16;
}