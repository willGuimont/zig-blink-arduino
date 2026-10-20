# Arduino Uno blink in Zig

Blinks the onboard D13 LED: 500 ms on, 500 ms off. Targets the
**Uno Rev3 (ATmega328P)**.

Requires Zig 0.17.0 with its LLVM AVR backend. Uses MicroZig 0.17.25.

```sh
zig build
```

Outputs are `zig-out/firmware/blink-uno.hex` and
`zig-out/firmware/blink-uno.elf`.

Upload using `avrdude`, replacing the serial device as appropriate:

```sh
avrdude -p atmega328p -c arduino -P /dev/ttyACM0 -b 115200 -D -U flash:w:zig-out/firmware/blink-uno.hex:i
```
