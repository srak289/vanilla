MeatyMachineHead
meatymachinehead
Invisible

[
6:40 AM
]
nova-smosha
:
or is the best way to just have a separate keybind to pull up harpoon.ui:toggle_quick_menu(harpoon:list()) and then delete them from there
[
7:47 AM
]
Stan
:
whats the benefit of using telescope
[
7:47 AM
]
Stan
:
it feels like a total minus 
[
7:47 AM
]
Stan
:
not being able to work the list in a buffer
[
1:18 PM
]
nova-smosha
:
i suppose it is
[
1:18 PM
]
nova-smosha
:
in theory it’s nice to have the file preview and search but ig in practice it’s unlikely i ever use anything other than my mappings to jump to a file
[
1:19 PM
]
Stan
:
its the same in the buffer window
[
1:19 PM
]
Stan
:
but you can delete/move and even type out paths
[
1:39 AM
]
Zephyr
:
hello everyone, i just started my vim journey, and i need some help

https://github.com/vivindeena/config/blob/main/nvim/lua/vivindeena/plugins/harpoon.lua

its just the basic conf that prime setup in his yt stream for nvim for noobs

but the harpoon jump is not working, and I'm not able to figure out why

current using a macos , and the Alacritty terminal, any help would be monumental
GitHub
config/nvim/lua/vivindeena/plugins/harpoon.lua at main · vivindeena...
neovim config file. Contribute to vivindeena/config development by creating an account on GitHub.
config/nvim/lua/vivindeena/plugins/harpoon.lua at main · vivindeena...
[
12:54 PM
]
phaseshift
:
Are you sure the harpoon list of not empty? 😆
[
12:55 PM
]
phaseshift
:
Also, basic maps like ctrl-... Might be getting swallowed by the terminal, ie nvim might not see it
[
5:21 AM
]
Zephyr
:
ohhh
[
5:21 AM
]
Zephyr
:
funnily, i added print statement, and now it seems to work fine
[
5:24 AM
]
Zephyr
:
i changed from this to 

vim.keymap.set("n", "<C-h>", function()
  harpoon:list():select(1)
end, { desc = "Jump to first Harpoon file" })


this

vim.keymap.set("n", "<C-h>", function()
  harpoon:list():select(1)
  vim.notify("In harpoon file 1", vim.log.levels.INFO, {title = "Harpoon",timeout = 200}) -- also print("in harpoon file 1") also worked
end, { desc = "Jump to first Harpoon file" })


and it magically started working
[
8:36 PM
]
donhasdat
:
ladies
[
8:37 PM
]
donhasdat
:
I want to install harpoon but i can't get it to to work since i'm pretty bad at following instructions
[
4:14 AM
]
phaseshift
:
Describe the symptoms. The expected result, the actual result. Nobody knows how to fix "it no worky"
[
9:51 AM
]
Epoetin Alfa
:
hey harpoon gang. I just started moving to a harpoon based workflow with oil.nvim. Was curious on how people manage files in the harpoon buffer? do you just manually add each file you're working on with a keybind? or is there something more sophisticated in mind. Was using leader+a as my bind for adding which is what I believe is described in the defaults. Is this just the pattern folks use? Thanks!
[
12:52 PM
]
phaseshift
:
Yes, that's what I did at least
[
12:55 PM
]
Epoetin Alfa
:
guess I just need to get used to it. manually adding files just seems strange to me just starting out, but I'm sure I'll get it after using it some more
[
1:30 PM
]
phaseshift
:
How many files are you adding?
[
1:34 PM
]
Epoetin Alfa
:
depends on the project. sometimes its a handful in different directories, so was wondering if the right pattern is to find them and add them individually or if there was something different.
[
1:34 PM
]
Epoetin Alfa
:
coming from a history of always using a typical file tree to manage files, so this is a new approach
[
1:40 PM
]
phaseshift
:
you wouldnt ever need to 'find them to add them', because you must already have it open if its a frequent file 😕
[
1:42 PM
]
Epoetin Alfa
:
well I have to find it the first time and add it with <leader>a each time I start nvim
[
1:42 PM
]
phaseshift
:
use the config to save the list. then its there every time
[
1:44 PM
]
Epoetin Alfa
:
ah, that makes sense. I think I am seeing it now
[
1:44 PM
]
Epoetin Alfa
:
didn't realize it saved the list by default. how does it do that without adding a file into the directory?
[
1:44 PM
]
Epoetin Alfa
:
just tried it with a simple directory and it does save it relative to that directory.
[
1:45 PM
]
Epoetin Alfa
:
thats awesome
[
1:45 PM
]
phaseshift
:
they go in .local/share/ somewhere iirc
[
5:05 PM
]
Stan
:
you can always write the file path manually in the harpoon buffer
[
5:05 PM
]
Stan
:
but in rare cases that can be faster
[
5:10 PM
]
LastDragon
:
This was happening for me, just caught this, the remove function is removing all marks...
[
6:59 PM
]
ronitdev
:
anyone interested in harpoon but for the browser
i really like the idea of it so i made it with claude
https://github.com/iusenvimbtw/balloon.git
burner github needed that username at the time lol
GitHub
GitHub - iusenvimbtw/balloon: Harpoon but for the browser
Harpoon but for the browser. Contribute to iusenvimbtw/balloon development by creating an account on GitHub.
GitHub - iusenvimbtw/balloon: Harpoon but for the browser
[
4:48 PM
]
FlanGrande
:
Does anyone know of a way of saving the current harpooned files when :mksessioning?
[
4:49 PM
]
FlanGrande
:
So when you open that session the harpooned files are there
[
1:26 PM
]
Ceredril
:
Hey folks! Just wanted to share my Harpoon config that adds some nice QoL improvements:

QoL harpoon config

    Add files to a given index instead of just adding to the end of the list (leader+1-4 to assign to positions)
    Toggle for add/remove instead of just add
        swap files when already in the list
        add to end when otherwise out of bounds
    Path normalization to prevent duplicate entries with different formats (relative vs absolute paths)
    Auto-remove duplicates when they creep in
    (some error handling with helpful notifications, just in case something breaks)


These have been pretty useful for me - Maybe they will be for you too! ^^ 
[
1:27 PM
]
Ceredril
:
PS: You will likely want to change the keybinds at the bottom to fit your setup, mine work with a German keyboard layout and certain custom escape sequences passed through by wezterm
[
1:46 PM
]
Ceredril
:

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",

Expand
harpoon.lua16 KB
[
1:48 PM
]
Ceredril
:
This should also be fixed with it btw
[
3:33 AM
]
Fira
:
Yo, folks!
Una pregunta, where does harpoon save its per-project entries? Is there any possibility to override that behaviour?
I'm using git worktrees and it would be nice to sync some of the harpoons accross different branches C:
Thanks in advance!!
[
3:36 AM
]
Fira
:
aight, found it, ~/.local/share/nvim/harpoon
[
3:42 AM
]
Fira
:
aight, they are sha-256 hashes of your path, so you might be able to pre-populate them if you know the path. That's exactly what I'm going to do C:::
[
7:04 PM
]
yosep
:
i love this
[
1:02 AM
]
Nucleo Fusion
:
Yo, im new to Neovim and i use LazyVim, i cant seem to setup Harpoon for it, it has harpoon as an Extras, but it doesnt open as a fuzzy finder for me.
[
3:47 AM
]
phaseshift
:
Harpoon isn't a fuzzy finder
[
3:54 AM
]
Nucleo Fusion
:
nah, i mean the popup that it has
[
3:54 AM
]
Nucleo Fusion
:
sorry my bad
[
3:55 AM
]
Nucleo Fusion
:
where you can search for files. I dont know much about nvim, i just started using it.
﻿

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED: Setup harpoon
    harpoon:setup({
      settings = {
        save_on_toggle = true, -- Save the harpoon file upon adding/removing a file
        sync_on_ui_close = true, -- Synchronize the list when the UI is closed
      },
    })

    -- Helper functions for file management
    local file_utils = {}

    -- Normalize path to handle both relative and absolute paths
    file_utils.normalize_path = function(path)
      if not path or path == "" then
        return ""
      end

      -- Handle both absolute paths and relative paths from cwd
      if path:sub(1, 1) ~= "/" and path:sub(1, 1) ~= "~" then
        -- It's a relative path, convert to absolute
        local cwd = vim.fn.getcwd()
        path = vim.fn.simplify(cwd .. "/" .. path)
      end

      -- Expand home directory if needed
      if path:sub(1, 1) == "~" then
        path = vim.fn.expand(path)
      end

      -- Normalize the path (resolve symlinks, normalize separators)
      path = vim.fn.resolve(path)
      path = vim.fn.fnamemodify(path, ":p")

      return path
    end

    -- Get current file path, normalized
    file_utils.get_current_file_path = function()
      local path = vim.fn.expand("%:p")
      return path ~= "" and path or ""
    end

    -- Find file index in Harpoon list, handling path normalization
    file_utils.find_file_index = function(list, file_path)
      if not list or not list.items or #list.items == 0 or not file_path or file_path == "" then
        return nil
      end

      local normalized_search_path = file_utils.normalize_path(file_path)
      if normalized_search_path == "" then
        return nil
      end

      for i, item in ipairs(list.items) do
        if item and item.value and item.value ~= "" then
          local normalized_item_path = file_utils.normalize_path(item.value)
          if normalized_item_path == normalized_search_path then
            return i
          end
        end
      end
      return nil
    end

    -- Create a notification with appropriate highlighting
    file_utils.notify = function(message, level)
      level = level or "info"
      vim.notify(message, vim.log.levels[string.upper(level)], { title = "Harpoon" })
    end

    -- Configure Telescope integration
    local function open_telescope_picker()
      local list = harpoon:list()

      if not list or not list.items or #list.items == 0 then
        file_utils.notify("Harpoon list is empty", "warn")
        return
      end

      local file_paths = {}
      for _, item in ipairs(list.items) do
        if item and item.value and item.value ~= "" then
          table.insert(file_paths, item.value)
        end
      end

      if #file_paths == 0 then
        file_utils.notify("No valid files in Harpoon list", "warn")
        return
      end

      local conf = require("telescope.config").values
      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    -- Toggle add/remove file
    local function toggle_file()
      local list = harpoon:list()
      if not list then
        file_utils.notify("Failed to get Harpoon list", "error")
        return
      end

      local current_file = file_utils.get_current_file_path()

      -- Don't process empty buffer
      if current_file == "" then
        file_utils.notify("Current buffer is not a file", "warn")
        return
      end

      local index = file_utils.find_file_index(list, current_file)

      if index then
        -- Always use the clear and rebuild approach for consistent indexing
        local new_items = {}
        for i, item in ipairs(list.items) do
          if i ~= index then
            -- Copy items except the one to be removed
            table.insert(new_items, vim.deepcopy(item))
          end
        end

        -- Rebuild the list preserving order but with updated sequential indices
        list:clear()
        for _, item in ipairs(new_items) do
          list:add(item)
        end

        file_utils.notify("Removed file from Harpoon", "info")
      else
        -- Check for and remove any duplicates with different path formats
        if list.items and #list.items > 0 then
          local found_duplicate = false
          local new_items = {}

          for i, item in ipairs(list.items) do
            if item and item.value and item.value ~= "" then
              local item_path = item.value
              if file_utils.normalize_path(item_path) == file_utils.normalize_path(current_file) then
                found_duplicate = true
                -- Skip this item (will be removed)
              else
                -- Keep this item
                table.insert(new_items, vim.deepcopy(item))
              end
            else
              -- Keep empty items
              table.insert(new_items, vim.deepcopy(item))
            end
          end

          if found_duplicate then
            -- Rebuild the list without duplicates
            list:clear()
            for _, item in ipairs(new_items) do
              list:add(item)
            end

            file_utils.notify("Removed duplicate entry with different path format", "info")
            return
          end
        end

        -- Add the current file
        list:add()
        file_utils.notify("Added file to Harpoon", "info")
      end
    end

    -- Remove duplicate entries from Harpoon list
    local function remove_duplicates(list)
      if not list or not list.items or #list.items <= 1 then
        return
      end

      local paths_seen = {}
      local to_remove = {}

      -- Identify duplicates
      for i, item in ipairs(list.items) do
        if item and item.value and item.value ~= "" then
          local normalized_path = file_utils.normalize_path(item.value)

          if paths_seen[normalized_path] then
            table.insert(to_remove, i)
          else
            paths_seen[normalized_path] = i
          end
        end
      end

      if #to_remove > 0 then
        -- Create a new items list without the duplicates
        local new_items = {}
        for i, item in ipairs(list.items) do
          -- Check if this index is in the to_remove list
          local should_remove = false
          for _, remove_idx in ipairs(to_remove) do
            if i == remove_idx then
              should_remove = true
              break
            end
          end

          -- Only keep items that aren't marked for removal
          if not should_remove then
            table.insert(new_items, vim.deepcopy(item))
          end
        end

        -- Rebuild the list with proper sequential indices
        list:clear()
        for _, item in ipairs(new_items) do
          list:add(item)
        end

        file_utils.notify("Removed " .. #to_remove .. " duplicate entries", "info")
      end
    end

    -- Smart file assignment function with proper swapping
    local function smart_assign_file(target_index)
      local list = harpoon:list()
      if not list then
        file_utils.notify("Failed to get Harpoon list", "error")
        return
      end

      local current_file = file_utils.get_current_file_path()

      -- Don't process empty buffer
      if current_file == "" then
        file_utils.notify("Current buffer is not a file", "warn")
        return
      end

      -- Remove duplicates first
      remove_duplicates(list)

      -- Create a copy of the current items for manipulation
      local new_items = {}
      if list.items then
        for _, item in ipairs(list.items) do
          table.insert(new_items, vim.deepcopy(item))
        end
      end

      -- Find if current file is already in the list
      local current_file_index = file_utils.find_file_index(list, current_file)

      -- Check if target position is within range
      local target_exists = target_index <= #new_items

      -- Handle the smart assignment based on current state
      if current_file_index == nil then
        -- Current file is not in list
        if not target_exists then
          -- Target position doesn't exist yet, extend the list
          while #new_items < target_index - 1 do
            table.insert(new_items, { value = "" }) -- Add placeholders
          end
          table.insert(new_items, { value = current_file })
          file_utils.notify("Added file to position " .. target_index)
        else
          -- Target position exists, replace but keep the old file
          local replaced_file = new_items[target_index]
          new_items[target_index] = { value = current_file }

          -- Don't lose the replaced file, add it at the end if valid
          if
            replaced_file
            and replaced_file.value ~= ""
            and file_utils.normalize_path(replaced_file.value) ~= file_utils.normalize_path(current_file)
          then
            table.insert(new_items, replaced_file)
            file_utils.notify("Replaced file at position " .. target_index .. " and moved previous to end")
          else
            file_utils.notify("Set file to position " .. target_index)
          end
        end
      else
        -- Current file is already in list
        if current_file_index == target_index then
          -- File is already at target position, do nothing
          file_utils.notify("File already at position " .. target_index)
          return
        else
          -- File needs to be moved to target position
          if target_exists then
            -- Swap the files - this is the key improvement
            local target_file = new_items[target_index]

            -- Place current file at target position
            new_items[target_index] = { value = current_file }

            -- Place target file at current file's position
            new_items[current_file_index] = target_file

            file_utils.notify("Swapped files between positions " .. current_file_index .. " and " .. target_index)
          else
            -- Target position doesn't exist, extend the list, then move
            while #new_items < target_index - 1 do
              table.insert(new_items, { value = "" }) -- Add placeholders
            end

            -- Add current file at target position
            table.insert(new_items, { value = current_file })

            -- Remove current file from its old position
            table.remove(new_items, current_file_index)

            file_utils.notify("Moved file from position " .. current_file_index .. " to " .. target_index)
          end
        end
      end

      -- Remove empty placeholders
      local final_items = {}
      for _, item in ipairs(new_items) do
        if item and item.value and item.value ~= "" then
          table.insert(final_items, item)
        end
      end

      -- Clear and rebuild the list
      list:clear()
      for _, item in ipairs(final_items) do
        list:add(item)
      end
    end

    -- Function to clear the entire Harpoon list
    local function clear_harpoon_list()
      local list = harpoon:list()
      if not list then
        file_utils.notify("Failed to get Harpoon list", "error")
        return
      end

      if not list.items or #list.items == 0 then
        file_utils.notify("Harpoon list is already empty", "info")
        return
      end

      list:clear()
      file_utils.notify("Cleared all files from Harpoon list")
    end

    -- Navigation functions with error handling
    local function navigate_to_file(index)
      local list = harpoon:list()
      if not list or not list.items then
        file_utils.notify("Failed to get Harpoon list", "error")
        return
      end

      if index > #list.items then
        file_utils.notify("No file at position " .. index, "warn")
        return
      end

      local success, err = pcall(function()
        list:select(index)
      end)
      if not success then
        file_utils.notify("Error navigating to file: " .. tostring(err), "error")
      end
    end

    local function navigate_prev()
      local list = harpoon:list()
      if not list or not list.items or #list.items == 0 then
        file_utils.notify("Harpoon list is empty", "warn")
        return
      end

      local success, err = pcall(function()
        list:prev()
      end)
      if not success then
        file_utils.notify("Error navigating to previous file: " .. tostring(err), "error")
      end
    end

    local function navigate_next()
      local list = harpoon:list()
      if not list or not list.items or #list.items == 0 then
        file_utils.notify("Harpoon list is empty", "warn")
        return
      end

      local success, err = pcall(function()
        list:next()
      end)
      if not success then
        file_utils.notify("Error navigating to next file: " .. tostring(err), "error")
      end
    end

    -- Define keymaps with descriptions
    local keymaps = {
      -- Toggle add/remove current file to/from Harpoon list
      {
        mode = "n",
        key = "<leader>a",
        cmd = toggle_file,
        desc = "Toggle file in Harpoon",
      },

      -- Clear Harpoon list
      {
        mode = "n",
        key = "<leader>ch",
        cmd = clear_harpoon_list,
        desc = "Clear all files from Harpoon list",
      },

      -- Smart add/swap for positions 1-4
      {
        mode = "n",
        key = "<leader>1",
        cmd = function()
          smart_assign_file(1)
        end,
        desc = "Smart assign file to Harpoon position 1",
      },
      {
        mode = "n",
        key = "<leader>2",
        cmd = function()
          smart_assign_file(2)
        end,
        desc = "Smart assign file to Harpoon position 2",
      },
      {
        mode = "n",
        key = "<leader>3",
        cmd = function()
          smart_assign_file(3)
        end,
        desc = "Smart assign file to Harpoon position 3",
      },
      {
        mode = "n",
        key = "<leader>4",
        cmd = function()
          smart_assign_file(4)
        end,
        desc = "Smart assign file to Harpoon position 4",
      },

      -- Quick navigation to Harpoon files (by index)
      {
        mode = "n",
        key = "<M-j>",
        cmd = function()
          navigate_to_file(1)
        end,
        desc = "Navigate to Harpoon file 1",
      },
      {
        mode = "n",
        key = "<M-k>",
        cmd = function()
          navigate_to_file(2)
        end,
        desc = "Navigate to Harpoon file 2",
      },
      {
        mode = "n",
        key = "<M-l>",
        cmd = function()
          navigate_to_file(3)
        end,
        desc = "Navigate to Harpoon file 3",
      },
      {
        mode = "n",
        key = "<M-ö>",
        cmd = function()
          navigate_to_file(4)
        end,
        desc = "Navigate to Harpoon file 4",
      },

      -- Open Harpoon in Telescope
      {
        mode = "n",
        key = "<C-e>",
        cmd = open_telescope_picker,
        desc = "Open Harpoon in Telescope",
      },

      -- Navigate through Harpoon list (prev/next)
      {
        mode = "n",
        key = "<C-S-P>",
        cmd = navigate_prev,
        desc = "Navigate to previous Harpoon file",
      },
      {
        mode = "n",
        key = "<C-S-N>",
        cmd = navigate_next,
        desc = "Navigate to next Harpoon file",
      },
    }

    -- Apply all keymaps
    for _, map in ipairs(keymaps) do
      vim.keymap.set(map.mode, map.key, map.cmd, { desc = map.desc })
    end
  end,
}

harpoon.lua16 KB

