-- ============================================================================
--                        WezTerm 配置文件 (中文版)
-- ============================================================================
-- 作者: 用户
-- 功能: 提供优化的终端体验，包含统一快捷键和中文注释
-- 最后更新: 2025年10月22日
-- ============================================================================

local wezterm = require 'wezterm'
local config = {}

-- 使用 config_builder() 以获得更好的配置支持
if wezterm.config_builder then
  config = wezterm.config_builder()
end


-- ============================================================================
--                          终端和窗口基本配置
-- ============================================================================

-- 默认 Shell 设置（使用 PowerShell）
config.default_prog = { 'pwsh' }

-- `Mica` `Acrylic`, `Auto`,`Disable`, `Tabbed`.
-- 使用 Acrylic 获得玻璃态效果，配合透明度实现桌面背景显示
config.win32_system_backdrop = 'Disable'
-- 设置为更低的透明度（0.0 为完全透明，1.0 为完全不透明）
config.window_background_opacity = 0.8


-- 窗口内边距（四周空白区域）
config.window_padding = {
  left = 10,   -- 左边距
  right = 10,  -- 右边距
  top = 10,    -- 上边距
  bottom = 5,  -- 下边距
}

-- 只有一个标签页时，是否隐藏标签栏
config.hide_tab_bar_if_only_one_tab = false

-- 更改字体大小时是否自动调整窗口大小
config.adjust_window_size_when_changing_font_size = false

-- 窗口装饰样式（包括最小化/最大化按钮）
config.window_decorations = "RESIZE"

-- 初始窗口大小（列数 × 行数）
config.initial_cols = 120
config.initial_rows = 30

-- 渲染引擎：WebGpu（最快）| OpenGl | Software
config.front_end = 'OpenGL'

-- 滚动历史行数（向上滚动能看到的最大行数）
config.scrollback_lines = 5000
config.enable_csi_u_key_encoding = true


-- ============================================================================
--                            主题和颜色配置
-- ============================================================================

-- 使用内置主题：Ayu Mirage（蓝色系深色主题）
config.color_scheme = 'Ayu Mirage'

-- 获取主题配置并自定义颜色
local color_scheme = wezterm.color.get_builtin_schemes()['Ayu Mirage']
color_scheme.foreground = '#ECEFF4'   -- 前景色（文本颜色）
color_scheme.background = '#000000'   -- 背景色（注释掉以启用透明效果）
color_scheme.cursor_bg = '#FFEE99'    -- 光标背景色
color_scheme.cursor_fg = '#1F2430'    -- 光标前景色
color_scheme.selection_bg = '#44475a' -- 选中文本背景色
color_scheme.selection_fg = '#ECEFF4' -- 选中文本前景色
config.colors = color_scheme

-- 标签栏样式配置（美化版）
config.colors.tab_bar = {
  background = 'rgba(13, 15, 20, 0.7)',  -- 标签栏背景色（半透明）
  active_tab = {
    bg_color = '#5BA3D0',              -- 活跃标签页背景色（蓝色高亮）
    fg_color = '#FFFFFF',              -- 活跃标签页文字色（白色）
    intensity = 'Bold',                -- 加粗显示
    italic = false,
  },
  inactive_tab = {
    bg_color = 'rgba(42, 48, 57, 0.6)',  -- 非活跃标签页背景色（半透明）
    fg_color = '#AAAAAA',              -- 非活跃标签页文字色（改为更亮）
    intensity = 'Normal',
  },
  inactive_tab_hover = {
    bg_color = 'rgba(63, 69, 79, 0.8)',  -- 鼠标悬停时背景色（半透明更明亮）
    fg_color = '#D0D0D0',              -- 鼠标悬停时文字色（更亮）
    italic = false,
    intensity = 'Bold',
  },
  new_tab = {
    bg_color = '#1F2430',              -- 新建标签页按钮背景色
    fg_color = '#888888',              -- 新建标签页按钮文字色
  },
  new_tab_hover = {
    bg_color = '#2A3039',              -- 新建按钮悬停时背景色
    fg_color = '#DDDDDD',              -- 新建按钮悬停时文字色（更亮）
    italic = false,
    intensity = 'Bold',
  },
}

-- 滚动条颜色配置（美化滚动条外观）
config.colors.scrollbar_thumb = '#FFEE99'  -- 滚动条滑块颜色

-- ============================================================================
--                            字体和文本配置
-- ============================================================================

-- 设置字体，使用候补字体列表以支持多语言
config.font = wezterm.font_with_fallback({
  'JetBrainsMono Nerd Font',           -- 主字体（英文编程字体）
  '霞鹜文楷 GB',                         -- 备用字体（中文显示）
  'Cascadia Mono',                     -- 备用字体（微软等宽字体）
})
config.font_size = 12.0

config.command_palette_font_size = 13.0
config.command_palette_rows = 24

-- 字体变体配置
config.font_rules = {
  {
    intensity = 'Normal',
    italic = false,
    font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Regular' }),
  },
  {
    intensity = 'Bold',
    italic = false,
    font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Bold' }),
  },
}

-- 启用连字（ligatures）- 将特定字符组合显示为单个符号
config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
-- 启用自定义块字形抗锯齿 - 使特殊符号显示更平滑
config.anti_alias_custom_block_glyphs = true

-- 光标闪烁速度（毫秒）
config.text_blink_rate = 800
config.cursor_blink_rate = 500
-- 光标样式：BlinkingBlock（闪烁方块）| Block | Beam | Underline
config.default_cursor_style = 'BlinkingBlock'
-- 启用光标配置
config.cursor_thickness = '3px'

-- ============================================================================
--                            滚动条美化配置
-- ============================================================================

-- 启用滚动条显示
config.enable_scroll_bar = true

-- 滚动条淡出时间（毫秒，0 表示禁用淡出效果）
config.min_scroll_bar_height = '3cell'

-- 滚动到底部
config.scroll_to_bottom_on_input = true

-- 启用 Kitty 图形协议（支持在终端显示图片）
config.enable_kitty_graphics = true

-- 关闭窗口时是否提示确认
config.window_close_confirmation = 'NeverPrompt'

-- 标签栏位置：false = 顶部，true = 底部
config.tab_bar_at_bottom = false
-- 使用高级标签栏样式（带圆角和美化效果）
config.use_fancy_tab_bar = true
-- 标签页的最大宽度
config.tab_max_width = 32
-- 在标签栏中显示"新建标签页"按钮
config.show_new_tab_button_in_tab_bar = true

-- 自定义标签栏标题格式
wezterm.on('format_tab_title', function(tab, tabs, tabline, pane, config)
  local title = tab.active_pane.title
  local user_vars = tab.active_pane.user_vars or {}
  local cwd_uri = tab.active_pane.current_working_dir

  local function extract_dir_from_uri(uri)
    if not uri then
      return nil
    end
    local path = uri.file_path
    if not path then
      local decoded = uri:sub((uri:find('://') or 0) + 3)
      local slash = decoded:find('/%w')
      if slash then
        path = decoded:sub(slash)
      end
    end
    return path
  end

  local path = extract_dir_from_uri(cwd_uri)
  if path and path ~= '' then
    local name = path:match('([^/\\]+)[/\\]*$') or path
    if name ~= '' then
      title = name
    end
  end

  if user_vars.WEZTERM_PROG then
    title = string.format('%s · %s', user_vars.WEZTERM_PROG, title)
  end

  if #title > 28 then
    title = title:sub(1, 25) .. '…'
  end

  if tab.is_active then
    return {
      { Background = { Color = '#5BA3D0' } },
      { Foreground = { Color = '#FFFFFF' } },
      { Text = ' ◆ ' .. title .. ' ' },
    }
  else
    return {
      { Background = { Color = '#2A3039' } },
      { Foreground = { Color = '#AAAAAA' } },
      { Text = ' ○ ' .. title .. ' ' },
    }
  end
end)

wezterm.on('prompt_send_command', function(window, pane)
  window:perform_action(
    wezterm.action.PromptInputLine {
      description = '输入命令并回车执行',
      action = wezterm.action_callback(function(_, p, line)
        if line and line:match('%S') then
          p:send_text(line .. '\n')
        end
      end),
    },
    pane
  )
end)

-- 关闭最后一个标签页后自动切换到上一个标签页
config.switch_to_last_active_tab_when_closing_tab = true

-- 禁用 Wayland（使用 X11，获得更好的兼容性）
config.enable_wayland = false

-- 启用超链接点击和鼠标选择
config.hyperlink_rules = {
  -- 匹配 URL（如 https://example.com）
  {
    regex = '\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b',
    format = '$0',
  },
  -- 匹配文件路径
  {
    regex = [[\b/[\w.\-/_]*]],
    format = 'file://$0',
  },
}

-- 鼠标配置：支持文本选择
config.mouse_bindings = {
  -- 右键粘贴
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
  -- 中键粘贴（X11风格，粘贴选中内容）
  {
    event = { Down = { streak = 1, button = 'Middle' } },
    mods = 'NONE',
    action = wezterm.action.PasteFrom 'PrimarySelection',
  },
  -- 左键双击选择单词
  {
    event = { Down = { streak = 2, button = 'Left' } },
    mods = 'NONE',
    action = wezterm.action.SelectTextAtMouseCursor 'Word',
  },
  -- 三击选择整行
  {
    event = { Down = { streak = 3, button = 'Left' } },
    mods = 'NONE',
    action = wezterm.action.SelectTextAtMouseCursor 'Line',
  },
  -- Shift + 左键拖动扩展选择
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'SHIFT',
    action = wezterm.action.ExtendSelectionToMouseCursor 'Cell',
  },
  -- Alt + 左键拖动选择多行
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'ALT',
    action = wezterm.action.SelectTextAtMouseCursor 'Line',
  },
}

-- 快捷键
config.keys = {
  -- ========== 窗格分割 ==========
  -- Windows Terminal 风格：Ctrl + Shift + D 水平分割（右侧）
  {
    key = 'd',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Windows Terminal 风格：Ctrl + Alt + - 水平分割
  {
    key = '-',
    mods = 'CTRL|ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Windows Terminal 风格：Ctrl + Shift + 右方向 垂直分割（下方）
  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Windows Terminal 风格：Ctrl + Alt + + 垂直分割
  {
    key = '=',
    mods = 'CTRL|ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- 原有快捷键保留
  {
    key = '-',
    mods = 'ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '=',
    mods = 'ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  -- ========== 窗格关闭 ==========
  -- Windows Terminal 风格：Ctrl + Shift + W 关闭窗格
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'w',
    mods = 'ALT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },

  -- ========== 窗格导航 ==========
  -- Windows Terminal 风格：Alt + 方向键 切换窗格
  {
    key = 'LeftArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  -- Vim 风格窗格导航（保留兼容）
  {
    key = 'h',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },

  -- ========== 窗格大小调整 ==========
  {
    key = 'LeftArrow',
    mods = 'ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'RightArrow',
    mods = 'ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = 'UpArrow',
    mods = 'ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 },
  },
  {
    key = 'DownArrow',
    mods = 'ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },
  -- Vim 风格调整大小（保留）
  {
    key = 'h',
    mods = 'ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'l',
    mods = 'ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = 'k',
    mods = 'ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 },
  },
  {
    key = 'j',
    mods = 'ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },

  -- ========== 标签页操作 ==========
  -- Ctrl + Shift + T 创建新标签页
  {
    key = 't',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  -- Alt + T 创建新标签页
  {
    key = 't',
    mods = 'ALT',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  -- Ctrl + Shift + W 关闭标签页（已定义在窗格关闭）

  -- ========== 标签页导航 ==========
  -- Ctrl + Tab / Ctrl + Shift + Tab 切换标签页
  {
    key = 'Tab',
    mods = 'CTRL',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = 'Tab',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  -- Ctrl + Page Down / Page Up 切换标签页
  {
    key = 'PageDown',
    mods = 'CTRL',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = 'PageUp',
    mods = 'CTRL',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  -- Ctrl + Shift + { / } 调整标签页顺序
  {
    key = '{',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.MoveTabRelative(-1),
  },
  {
    key = '}',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.MoveTabRelative(1),
  },
  -- Ctrl + 数字快速切换标签页
  {
    key = '1',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(0),
  },
  {
    key = '2',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(1),
  },
  {
    key = '3',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(2),
  },
  {
    key = '4',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(3),
  },
  {
    key = '5',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(4),
  },
  {
    key = '6',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(5),
  },
  {
    key = '7',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(6),
  },
  {
    key = '8',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(7),
  },
  {
    key = '9',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(8),
  },
  -- Alt + 数字快速切换标签页（备选）
  {
    key = '1',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(0),
  },
  {
    key = '2',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(1),
  },
  {
    key = '3',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(2),
  },
  {
    key = '4',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(3),
  },
  {
    key = '5',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(4),
  },
  {
    key = '6',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(5),
  },
  {
    key = '7',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(6),
  },
  {
    key = '8',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(7),
  },
  {
    key = '9',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(8),
  },

  -- ========== 复制/粘贴 ==========
  {
    key = 'c',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CopyTo 'Clipboard',
  },
  {
    key = 'v',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.PasteFrom 'Clipboard',
  },

  -- ========== 字体大小 ==========
  -- Ctrl + = / Ctrl + - 调整字体
  {
    key = '=',
    mods = 'CTRL',
    action = wezterm.action.IncreaseFontSize,
  },
  {
    key = '-',
    mods = 'CTRL',
    action = wezterm.action.DecreaseFontSize,
  },
  {
    key = '0',
    mods = 'CTRL',
    action = wezterm.action.ResetFontSize,
  },
  -- Ctrl + Shift + = / - 调整字体（备选）
  {
    key = '=',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.IncreaseFontSize,
  },
  {
    key = '_',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.DecreaseFontSize,
  },

  -- ========== 窗口透明度调节 ==========
  {
    key = 'n',
    mods = 'ALT|SHIFT',
    action = wezterm.action_callback(function(window, pane)
      local overrides = window:get_config_overrides() or {}
      overrides.window_background_opacity = math.min(
        (overrides.window_background_opacity or 0.75) + 0.1,
        1.0
      )
      window:set_config_overrides(overrides)
    end),
  },

  {
    key = 'm',
    mods = 'ALT|SHIFT',
    action = wezterm.action_callback(function(window, pane)
      local overrides = window:get_config_overrides() or {}
      overrides.window_background_opacity = math.max(
        (overrides.window_background_opacity or 0.75) - 0.1,
        0.1
      )
      window:set_config_overrides(overrides)
    end),
  },

  -- ========== 其他功能 ==========
  -- Alt + Shift + D 智能分割窗格（根据窗格形状自动选择方向）
  {
    key = 'd',
    mods = 'ALT|SHIFT',
    action = wezterm.action_callback(function(window, pane)
      local dims = pane:get_dimensions()
      -- 如果宽度明显大于高度，则左右分割（SplitVertical）
      -- 否则上下分割（SplitHorizontal）
      if dims.pixel_width < dims.pixel_height * 1.2 then
        -- 宽屏幕，左右分割
        window:perform_action(wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }, pane)
      else
        -- 竖屏幕或接近正方形，上下分割
        window:perform_action(wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }, pane)
      end
    end),
  },
  -- F1 打开命令调板（映射为 Shift + Ctrl + P）
  {
    key = 'F1',
    mods = '',
    action = wezterm.action.ActivateCommandPalette,
  },
  -- F11 全屏
  {
    key = 'F11',
    mods = '',
    action = wezterm.action.ToggleFullScreen,
  },
  -- F12 打开快速选择菜单
  {
    key = 'F12',
    mods = '',
    action = wezterm.action.ShowLauncher,
  },
  -- Ctrl + Shift + L 打开命令调板
  {
    key = 'l',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateCommandPalette,
  },
  -- Ctrl + Shift + Space 显示 Debug 菜单（仅调试时有用）
  {
    key = 'F10',
    mods = 'ALT',
    action = wezterm.action.ShowDebugOverlay,
  },
  -- Ctrl + Alt + Enter 打开输入框并发送命令
  {
    key = 'Enter',
    mods = 'CTRL|ALT',
    action = wezterm.action.EmitEvent 'prompt_send_command',
  },
   
  -- ========== 窗口操作 ==========
  -- Ctrl + Shift + N 新建窗口
  {
    key = 'n',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SpawnWindow,
  },
  -- Alt + F4 关闭当前标签页
  {
    key = 'F4',
    mods = 'ALT',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },

  -- ========== 搜索 ==========
  -- Ctrl + Shift + F 打开搜索
  {
    key = 'f',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.Search 'CurrentSelectionOrEmptyString',
  },

  -- ========== 其他快捷键 ==========
  -- Ctrl + Shift + H 打开帮助
  {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ShowLauncher,
  },
}

-- ========== 性能优化 ==========
-- 启用 GPU 加速渲染（已启用 WebGpu）
config.prefer_egl = true
-- 优化动画帧率
config.animation_fps = 144
-- 启用鼠标报告
config.mouse_wheel_scrolls_tabs = true

-- ========== 高级视觉效果 ==========
-- 启用 SSE4 支持以获得更好的性能
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- Windows 特定优化
  config.launch_menu = {
    {
      label = 'PowerShell Core',
      args = { 'pwsh' },
    },
    {
      label = 'PowerShell 5.1',
      args = { 'powershell.exe' },
    },
    -- ========== MSYS2 启动项 ==========
    -- 使用 cmd.exe 启动 msys2 脚本，以确保正确的环境初始化和命令可用性
    {
      label = 'MSYS2 (MSYS 默认)',
      args = { 'cmd.exe', '/c', 'msys2', '-no-start', '-msys' },
    },
    {
      label = 'MSYS2 (MinGW64)',
      args = { 'cmd.exe', '/c', 'msys2', '-no-start', '-mingw64' },
    },
    {
      label = 'MSYS2 (MinGW32)',
      args = { 'cmd.exe', '/c', 'msys2', '-no-start', '-mingw32' },
    },
    {
      label = 'MSYS2 (UCRT64)',
      args = { 'cmd.exe', '/c', 'msys2', '-no-start', '-ucrt64' },
    },
    {
      label = 'MSYS2 (Clang64)',
      args = { 'cmd.exe', '/c', 'msys2', '-no-start', '-clang64' },
    },
    {
      label = 'MSYS2 (ClangARM64)',
      args = { 'cmd.exe', '/c', 'msys2', '-no-start', '-clangarm64' },
    },
    {
      label = 'MSYS2 (MSYS + 完整PATH)',
      args = { 'cmd.exe', '/c', 'msys2', '-no-start', '-msys', '-use-full-path' },
    },
    {
      label = 'MSYS2 (MinGW64 + 完整PATH)',
      args = { 'cmd.exe', '/c', 'msys2', '-no-start', '-mingw64', '-use-full-path' },
    },
  }
end

-- 返回配置
return config
