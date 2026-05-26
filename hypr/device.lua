-- MONITORS
hl.monitor({
  output   = "eDP-1",
  mode   = "1920x1200@47.96",
  position = "auto",
  vrr = 1,
  scale  = 1,
})
hl.monitor({
  output   = "DP-6",
  mode   = "5120x1440@59.98",
  position = "0x0",
  vrr = 1,
  scale  = 1,
})
hl.monitor({
  output   = "",
  mode   = "highres",
  position = "auto",
  scale  = 1,
})

hl.on("monitor.removed", function(m)
	if m.name ~= "eDP-1" then
    hl.monitor({ output = "eDP-1", disabled = false })
	end
end)

-- PERMISSIONS
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly

-- hl.config({
--   ecosystem = {
--   enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-- LOOK AND FEEL
-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
  name    = "epic-mouse-v1",
  sensitivity = -0.5,
})

