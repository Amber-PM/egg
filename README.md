<h1 align="center">
  <a href="https://github.com/Amber-PM/Amber">
    <img src=".github/readme/amberpm.png" width="128" height="128" alt="AmberPM Logo" title="AmberPM" />
  </a>
</h1>

<p align="center">
  <strong>AmberPM egg for Pterodactyl and Pelican</strong>
</p>

---

Installs the [AmberPM](https://github.com/Amber-PM/Amber) phar and the [PHP binaries](https://github.com/Amber-PM/PHP-Binaries) with ext-rtc, ready for NetherNet (Minecraft 26.60+).

## Import

1. Admin panel → Nests (or Eggs) → Import Egg → `egg-amberpm.json`.
2. Create the server with this egg. Allocations open TCP and UDP.

## Variables

| Variable | Value |
|---|---|
| Public IP | The public IP players use. Required. |
| NetherNet UDP port | An extra allocation of this server. Empty uses the main port. |
| AmberPM version | `latest` or a release tag |

## Ports

| Allocations | Result |
|---|---|
| Main port + one extra (recommended) | Set the extra one as NetherNet UDP port. Every version joins on `IP:main` |
| Main port only | Leave NetherNet UDP port empty. RakNet is turned off, only 26.60+ can join |

The node must forward allocations with the same port number outside and inside.

## Notes

- x86_64 nodes only.
- Back up `nethernet.key` in the server files. Losing it makes players trust the server again.
- Setup help: [NetherNet Setup](https://github.com/Amber-PM/Amber/wiki/NetherNet-Setup).

## License

[LGPL-3.0](https://github.com/Amber-PM/Amber/blob/main/LICENSE)
