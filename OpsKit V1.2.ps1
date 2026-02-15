# ==============================================================================
# OpsKit v1.2 - Pro (Stable Release)
# Author: Rex | Date: 2026-02-15
# ==============================================================================

# 加载 WPF 框架
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# ==============================================================================
# 1. XAML 界面定义
# ==============================================================================
[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="OpsKit v1.2 - Pro" Height="960" Width="1280"
        WindowStartupLocation="CenterScreen" ResizeMode="CanResize"
        Background="#F5F5F7" FontFamily="Segoe UI, Microsoft YaHei">
    <Window.Resources>
        <Style TargetType="Button" x:Key="CardButtonStyle">
            <Setter Property="Background" Value="White"/>
            <Setter Property="BorderBrush" Value="#E5E5EA"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Setter Property="Margin" Value="10"/>
            <Setter Property="Padding" Value="15"/> 
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border x:Name="border" Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" CornerRadius="12"> 
                            <Border.Effect><DropShadowEffect Color="#000000" Opacity="0.04" BlurRadius="10" ShadowDepth="2"/></Border.Effect>
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True"><Setter TargetName="border" Property="Background" Value="#F2F2F7"/></Trigger>
                            <Trigger Property="IsPressed" Value="True"><Setter TargetName="border" Property="Background" Value="#E5E5EA"/></Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
        <Style TargetType="TextBlock" x:Key="CardTitle">
            <Setter Property="FontSize" Value="20"/> <Setter Property="FontWeight" Value="Bold"/>
            <Setter Property="Foreground" Value="#1D1D1F"/> <Setter Property="TextAlignment" Value="Center"/> <Setter Property="Margin" Value="0,10,0,5"/>
        </Style>
        <Style TargetType="TextBlock" x:Key="CardDesc">
            <Setter Property="FontSize" Value="14"/> <Setter Property="Foreground" Value="#86868B"/>
            <Setter Property="TextAlignment" Value="Center"/> <Setter Property="TextWrapping" Value="Wrap"/>
        </Style>
        <Style TargetType="TextBlock" x:Key="CardIcon">
             <Setter Property="FontSize" Value="48"/> <Setter Property="HorizontalAlignment" Value="Center"/> <Setter Property="Margin" Value="0,0,0,5"/>
        </Style>
        <Style TargetType="TabItem">
            <Setter Property="FontSize" Value="18"/> <Setter Property="FontWeight" Value="SemiBold"/>
            <Setter Property="Background" Value="Transparent"/> <Setter Property="Foreground" Value="#86868B"/> <Setter Property="Padding" Value="25,12"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="TabItem">
                        <Border Name="Border" Background="{TemplateBinding Background}" CornerRadius="8" Margin="5,0">
                            <ContentPresenter x:Name="ContentSite" VerticalAlignment="Center" HorizontalAlignment="Center" ContentSource="Header" Margin="10,2"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsSelected" Value="True"><Setter TargetName="Border" Property="Background" Value="#007AFF"/> <Setter Property="Foreground" Value="White"/></Trigger>
                            <Trigger Property="IsSelected" Value="False"><Setter Property="Foreground" Value="#636366"/></Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
    </Window.Resources>

    <Grid Margin="20">
        <Grid.RowDefinitions><RowDefinition Height="Auto"/><RowDefinition Height="*"/><RowDefinition Height="40"/></Grid.RowDefinitions>

        <Grid Grid.Row="0" Margin="0,0,0,20">
            <Grid.ColumnDefinitions><ColumnDefinition Width="*"/><ColumnDefinition Width="Auto"/></Grid.ColumnDefinitions>
            <StackPanel Grid.Column="0" VerticalAlignment="Center">
                <TextBlock x:Name="TxtAppTitle" Text="OpsKit v1.2" FontSize="32" FontWeight="Bold" Foreground="#1D1D1F"/>
                <TextBlock x:Name="TxtAppSub" Text="Designed by Rex" FontSize="16" Foreground="#86868B" Margin="2,0,0,0"/>
            </StackPanel>
            <ComboBox x:Name="CmbLang" Grid.Column="1" Width="140" Height="35" FontSize="14" VerticalAlignment="Center">
                <ComboBoxItem Content="English (Default)" Tag="Default" IsSelected="True"/>
            </ComboBox>
        </Grid>

        <TabControl Grid.Row="1" BorderThickness="0" Background="Transparent">
            <TabItem x:Name="TabNet" Header="🌐 Network">
                <Grid Margin="0,20,0,0">
                    <Grid.ColumnDefinitions><ColumnDefinition Width="*"/><ColumnDefinition Width="*"/><ColumnDefinition Width="*"/></Grid.ColumnDefinitions>
                    <Grid.RowDefinitions><RowDefinition Height="200"/><RowDefinition Height="200"/></Grid.RowDefinitions>

                    <Button x:Name="BtnNetReset" Grid.Row="0" Grid.Column="0" Style="{StaticResource CardButtonStyle}">
                        <StackPanel>
                            <TextBlock Text="🌐" Style="{StaticResource CardIcon}" Foreground="#007AFF"/>
                            <TextBlock x:Name="TxtBtnNetReset_T" Text="Network Reset" Style="{StaticResource CardTitle}"/>
                            <TextBlock x:Name="TxtBtnNetReset_D" Text="Flush DNS / Winsock" Style="{StaticResource CardDesc}"/>
                        </StackPanel>
                    </Button>
                    <Button x:Name="BtnWifiReveal" Grid.Row="0" Grid.Column="1" Style="{StaticResource CardButtonStyle}">
                        <StackPanel>
                            <TextBlock Text="🔑" Style="{StaticResource CardIcon}" Foreground="#34C759"/>
                            <TextBlock x:Name="TxtBtnWifiReveal_T" Text="WiFi Password" Style="{StaticResource CardTitle}"/>
                            <TextBlock x:Name="TxtBtnWifiReveal_D" Text="Reveal saved keys" Style="{StaticResource CardDesc}"/>
                        </StackPanel>
                    </Button>
                    <Button x:Name="BtnUnlockBrowser" Grid.Row="0" Grid.Column="2" Style="{StaticResource CardButtonStyle}">
                        <StackPanel>
                            <TextBlock Text="🔓" Style="{StaticResource CardIcon}" Foreground="#FF9500"/>
                            <TextBlock x:Name="TxtBtnUnlockBrowser_T" Text="Unlock Browser" Style="{StaticResource CardTitle}"/>
                            <TextBlock x:Name="TxtBtnUnlockBrowser_D" Text="Remove 'Managed by Org'" Style="{StaticResource CardDesc}"/>
                        </StackPanel>
                    </Button>
                    <Button x:Name="BtnResetHosts" Grid.Row="1" Grid.Column="0" Style="{StaticResource CardButtonStyle}">
                        <StackPanel>
                            <TextBlock Text="📝" Style="{StaticResource CardIcon}" Foreground="#5856D6"/>
                            <TextBlock x:Name="TxtBtnResetHosts_T" Text="Reset Hosts" Style="{StaticResource CardTitle}"/>
                            <TextBlock x:Name="TxtBtnResetHosts_D" Text="Fix access issues" Style="{StaticResource CardDesc}"/>
                        </StackPanel>
                    </Button>
                    <Button x:Name="BtnFixSmb" Grid.Row="1" Grid.Column="1" Style="{StaticResource CardButtonStyle}">
                        <StackPanel>
                            <TextBlock Text="📂" Style="{StaticResource CardIcon}" Foreground="#FFCC00"/>
                            <TextBlock x:Name="TxtBtnFixSmb_T" Text="Fix LAN Sharing" Style="{StaticResource CardTitle}"/>
                            <TextBlock x:Name="TxtBtnFixSmb_D" Text="Enable Discovery / SMB" Style="{StaticResource CardDesc}"/>
                        </StackPanel>
                    </Button>
                </Grid>
            </TabItem>

            <TabItem x:Name="TabSys" Header="🖥️ System" IsSelected="True">
                <Grid Margin="0,20,0,0">
                    <Grid.ColumnDefinitions><ColumnDefinition Width="*"/><ColumnDefinition Width="*"/><ColumnDefinition Width="*"/></Grid.ColumnDefinitions>
                    <Grid.RowDefinitions><RowDefinition Height="200"/><RowDefinition Height="200"/></Grid.RowDefinitions>

                    <Button x:Name="BtnFixIcons" Grid.Row="0" Grid.Column="0" Style="{StaticResource CardButtonStyle}">
                        <StackPanel>
                            <TextBlock Text="🖼️" Style="{StaticResource CardIcon}" Foreground="#AF52DE"/>
                            <TextBlock x:Name="TxtBtnFixIcons_T" Text="Rebuild Icons" Style="{StaticResource CardTitle}"/>
                            <TextBlock x:Name="TxtBtnFixIcons_D" Text="Fix corrupted icons" Style="{StaticResource CardDesc}"/>
                        </StackPanel>
                    </Button>
                    <Button x:Name="BtnRestartExplorer" Grid.Row="0" Grid.Column="1" Style="{StaticResource CardButtonStyle}">
                        <StackPanel>
                            <TextBlock Text="🔄" Style="{StaticResource CardIcon}" Foreground="#FF3B30"/>
                            <TextBlock x:Name="TxtBtnRestartExplorer_T" Text="Restart Desktop" Style="{StaticResource CardTitle}"/>
                            <TextBlock x:Name="TxtBtnRestartExplorer_D" Text="Fix frozen taskbar" Style="{StaticResource CardDesc}"/>
                        </StackPanel>
                    </Button>
                    <Button x:Name="BtnHighPerf" Grid.Row="0" Grid.Column="2" Style="{StaticResource CardButtonStyle}">
                        <StackPanel>
                            <TextBlock Text="🚀" Style="{StaticResource CardIcon}" Foreground="#FF2D55"/>
                            <TextBlock x:Name="TxtBtnHighPerf_T" Text="Ultimate Power" Style="{StaticResource CardTitle}"/>
                            <TextBlock x:Name="TxtBtnHighPerf_D" Text="Unlock performance plan" Style="{StaticResource CardDesc}"/>
                        </StackPanel>
                    </Button>
                    <Button x:Name="BtnFixUpdate" Grid.Row="1" Grid.Column="0" Style="{StaticResource CardButtonStyle}">
                        <StackPanel>
                            <TextBlock Text="🛠️" Style="{StaticResource CardIcon}" Foreground="#007AFF"/>
                            <TextBlock x:Name="TxtBtnFixUpdate_T" Text="Fix Updates" Style="{StaticResource CardTitle}"/>
                            <TextBlock x:Name="TxtBtnFixUpdate_D" Text="Clear update cache" Style="{StaticResource CardDesc}"/>
                        </StackPanel>
                    </Button>
                    <Button x:Name="BtnWin11Menu" Grid.Row="1" Grid.Column="1" Style="{StaticResource CardButtonStyle}">
                        <StackPanel>
                            <TextBlock Text="🖱️" Style="{StaticResource CardIcon}" Foreground="#5AC8FA"/>
                            <TextBlock x:Name="TxtBtnWin11Menu_T" Text="Classic Menu" Style="{StaticResource CardTitle}"/>
                            <TextBlock x:Name="TxtBtnWin11Menu_D" Text="Win10 style context menu" Style="{StaticResource CardDesc}"/>
                        </StackPanel>
                    </Button>
                    <Button x:Name="BtnCleanDisk" Grid.Row="1" Grid.Column="2" Style="{StaticResource CardButtonStyle}">
                        <StackPanel>
                            <TextBlock Text="🧹" Style="{StaticResource CardIcon}" Foreground="#FF9500"/>
                            <TextBlock x:Name="TxtBtnCleanDisk_T" Text="Disk Cleanup" Style="{StaticResource CardTitle}"/>
                            <TextBlock x:Name="TxtBtnCleanDisk_D" Text="Deep clean temp files" Style="{StaticResource CardDesc}"/>
                        </StackPanel>
                    </Button>
                </Grid>
            </TabItem>

            <TabItem x:Name="TabHard" Header="🖨️ Hardware">
                <Grid Margin="0,20,0,0">
                    <Grid.ColumnDefinitions><ColumnDefinition Width="*"/><ColumnDefinition Width="*"/><ColumnDefinition Width="*"/></Grid.ColumnDefinitions>
                    <Grid.RowDefinitions><RowDefinition Height="200"/><RowDefinition Height="200"/></Grid.RowDefinitions>

                    <Button x:Name="BtnFixPrintSvc" Grid.Row="0" Grid.Column="0" Style="{StaticResource CardButtonStyle}">
                        <StackPanel>
                            <TextBlock Text="🖨️" Style="{StaticResource CardIcon}" Foreground="#FF9500"/>
                            <TextBlock x:Name="TxtBtnFixPrintSvc_T" Text="Fix Spooler" Style="{StaticResource CardTitle}"/>
                            <TextBlock x:Name="TxtBtnFixPrintSvc_D" Text="Clear stuck queue" Style="{StaticResource CardDesc}"/>
                        </StackPanel>
                    </Button>
                    <Button x:Name="BtnFixPrint11b" Grid.Row="0" Grid.Column="1" Style="{StaticResource CardButtonStyle}">
                        <StackPanel>
                            <TextBlock Text="💉" Style="{StaticResource CardIcon}" Foreground="#FF3B30"/>
                            <TextBlock x:Name="TxtBtnFixPrint11b_T" Text="Fix Share 0x11b" Style="{StaticResource CardTitle}"/>
                            <TextBlock x:Name="TxtBtnFixPrint11b_D" Text="Fix Win10/11 printer error" Style="{StaticResource CardDesc}"/>
                        </StackPanel>
                    </Button>
                    <Button x:Name="BtnSsdTrim" Grid.Row="0" Grid.Column="2" Style="{StaticResource CardButtonStyle}">
                        <StackPanel>
                            <TextBlock Text="&#xEDA2;" 
                   FontFamily="Segoe MDL2 Assets" Style="{StaticResource CardIcon}" Foreground="#34C759"/>
                            <TextBlock x:Name="TxtBtnSsdTrim_T" Text="SSD Optimize" Style="{StaticResource CardTitle}"/>
                            <TextBlock x:Name="TxtBtnSsdTrim_D" Text="Manual TRIM" Style="{StaticResource CardDesc}"/>
                        </StackPanel>
                    </Button>
                    <Button x:Name="BtnDiskSmart" Grid.Row="1" Grid.Column="0" Style="{StaticResource CardButtonStyle}">
                        <StackPanel>
                            <TextBlock Text="&#xE7F1;" 
                   FontFamily="Segoe MDL2 Assets" Style="{StaticResource CardIcon}" Foreground="#5856D6"/>
                            <TextBlock x:Name="TxtBtnDiskSmart_T" Text="Health Check" Style="{StaticResource CardTitle}"/>
                            <TextBlock x:Name="TxtBtnDiskSmart_D" Text="Check S.M.A.R.T." Style="{StaticResource CardDesc}"/>
                        </StackPanel>
                    </Button>
                    <Button x:Name="BtnSysRepair" Grid.Row="1" Grid.Column="1" Grid.ColumnSpan="2" Style="{StaticResource CardButtonStyle}" Background="#EBF2FF">
                        <StackPanel Orientation="Horizontal" HorizontalAlignment="Center">
                             <TextBlock Text="🚑" FontSize="50" Margin="0,0,20,0" VerticalAlignment="Center"/>
                             <StackPanel VerticalAlignment="Center">
                                <TextBlock x:Name="TxtBtnSysRepair_T" Text="System Repair (SFC+DISM)" FontSize="22" FontWeight="Bold" Foreground="#007AFF"/>
                                <TextBlock x:Name="TxtBtnSysRepair_D" Text="Deep scan &amp; fix system files" FontSize="15" Foreground="#007AFF"/>
                             </StackPanel>
                        </StackPanel>
                    </Button>
                </Grid>
            </TabItem>
        </TabControl>

        <StatusBar Grid.Row="2" Background="Transparent" Foreground="#86868B" FontSize="14">
            <StatusBarItem><TextBlock x:Name="StatusBarText" Text="Ready."/></StatusBarItem>
        </StatusBar>
    </Grid>
</Window>
"@

# ==============================================================================
# 2. 核心逻辑处理 (PowerShell)
# ==============================================================================

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

# ------------------------------------------------------------------------------
# 弹窗与状态栏函数
# ------------------------------------------------------------------------------
Function Show-AppleAlert {
    param([string]$Title, [string]$Message)
    
    $alertWin = New-Object System.Windows.Window
    $alertWin.Title = $Title
    $alertWin.Width = 600
    # 【修复】高度设为自动，防止内容被切断
    $alertWin.SizeToContent = "Height"
    
    $alertWin.WindowStartupLocation = "Manual"
    $alertWin.Topmost = $true
    $screenWidth = [System.Windows.SystemParameters]::PrimaryScreenWidth
    $screenHeight = [System.Windows.SystemParameters]::PrimaryScreenHeight
    $alertWin.Left = ($screenWidth / 4) - ($alertWin.Width / 2)
    $alertWin.Top = ($screenHeight / 2) - 200 # 稍微靠上一点
    
    $alertWin.Background = "#F5F5F7"; $alertWin.ResizeMode = "NoResize"
    $mainStack = New-Object System.Windows.Controls.StackPanel; $mainStack.Margin = "40,30,40,30"

    # 标题
    $txtTitle = New-Object System.Windows.Controls.TextBlock
    $txtTitle.Text = $Title; $txtTitle.FontSize = 26; $txtTitle.FontWeight = "Bold"
    $txtTitle.Foreground = "#1D1D1F"; $txtTitle.Margin = "0,0,0,15"; $txtTitle.FontFamily = "Segoe UI Semibold"
    [void]$mainStack.Children.Add($txtTitle)

    # 正文 (去掉了 Height 限制)
    $txtMsg = New-Object System.Windows.Controls.TextBlock
    $txtMsg.Text = $Message; $txtMsg.FontSize = 16; $txtMsg.Foreground = "#424245"
    $txtMsg.TextWrapping = "Wrap"; $txtMsg.LineHeight = 24
    [void]$mainStack.Children.Add($txtMsg)

    # 按钮
    $btnStack = New-Object System.Windows.Controls.StackPanel; $btnStack.Orientation = "Horizontal"; $btnStack.HorizontalAlignment = "Right"; $btnStack.Margin = "0,20,0,0"

    $btnOK = New-Object System.Windows.Controls.Button
    $btnOK.Content = "OK"; $btnOK.FontSize = 15; $btnOK.FontWeight = "SemiBold"
    $btnOK.Width = 120; $btnOK.Height = 40; $btnOK.Cursor = "Hand"
    
    $templateXml = @"
    <ControlTemplate xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" TargetType="Button">
        <Border Background="#007AFF" CornerRadius="10">
            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
        </Border>
    </ControlTemplate>
"@
    $btnOK.Template = [Windows.Markup.XamlReader]::Parse($templateXml)
    $btnOK.Foreground = "White"
    $btnOK.Add_Click({ $alertWin.Close() })
    
    [void]$btnStack.Children.Add($btnOK)
    [void]$mainStack.Children.Add($btnStack)
    $alertWin.Content = $mainStack
    
    [void]$alertWin.ShowDialog()
}

# ------------------------------------------------------------------------------
# 通用的 Show-ProDialog (修复：补全了控件组装逻辑)
# ------------------------------------------------------------------------------
Function Show-ProDialog {
    param(
        [string]$Title, 
        [string]$Message, 
        [hashtable]$ButtonConfig 
    )
    
    $alertWin = New-Object System.Windows.Window
    $alertWin.Title = $Title; $alertWin.Width = 620; $alertWin.SizeToContent = "Height" # 高度自适应
    
    $alertWin.WindowStartupLocation = "Manual"
    $alertWin.Topmost = $true
    $screenWidth = [System.Windows.SystemParameters]::PrimaryScreenWidth
    $screenHeight = [System.Windows.SystemParameters]::PrimaryScreenHeight
    $alertWin.Left = ($screenWidth / 4) - ($alertWin.Width / 2)
    $alertWin.Top = ($screenHeight / 2) - 200
    
    $alertWin.Background = "#F5F5F7"; $alertWin.ResizeMode = "NoResize"
    $mainStack = New-Object System.Windows.Controls.StackPanel; $mainStack.Margin = "40,35,40,30"

    # 1. 标题
    $txtTitle = New-Object System.Windows.Controls.TextBlock
    $txtTitle.Text = $Title; $txtTitle.FontSize = 26; $txtTitle.FontWeight = "Bold"
    $txtTitle.Foreground = "#1D1D1F"; $txtTitle.Margin = "0,0,0,15"; $txtTitle.FontFamily = "Segoe UI Semibold"
    [void]$mainStack.Children.Add($txtTitle)

    # 2. 内容 (使用 TextBlock 自动换行)
    $txtMsg = New-Object System.Windows.Controls.TextBlock
    $txtMsg.Text = $Message; $txtMsg.FontSize = 16; $txtMsg.Foreground = "#424245"
    $txtMsg.TextWrapping = "Wrap"; $txtMsg.LineHeight = 24
    [void]$mainStack.Children.Add($txtMsg)

    # 3. 按钮容器
    $btnStack = New-Object System.Windows.Controls.StackPanel; $btnStack.Orientation = "Horizontal"; $btnStack.HorizontalAlignment = "Right"; $btnStack.Margin = "0,25,0,0"

    # 4. 动态生成按钮 (直接在循环中生成，确保变量不丢失)
    foreach ($b in $ButtonConfig.Buttons) {
        $btn = New-Object System.Windows.Controls.Button
        $btn.Content = $b.Text; $btn.FontSize = 14; $btn.FontWeight = "SemiBold"
        $btn.Width = 120; $btn.Height = 40; $btn.Cursor = "Hand"; $btn.Margin = "12,0,0,0"
        
        # 动态设置颜色
        $bgColor = $b.Bg
        $fgColor = $b.Fg
        $templateXml = @"
        <ControlTemplate xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" TargetType="Button">
            <Border Background="$bgColor" CornerRadius="10"><ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/></Border>
        </ControlTemplate>
"@
        $btn.Template = [Windows.Markup.XamlReader]::Parse($templateXml)
        $btn.Foreground = $fgColor
        
        # 【关键修复】使用 .GetNewClosure() 捕获当前变量状态
        # 这样点击时，$val 依然是当前的 "Yes" 或 "No"
        $val = $b.Value
        $btn.Add_Click({ 
                $alertWin.Tag = $val
                $alertWin.Close() 
            }.GetNewClosure())
        
        [void]$btnStack.Children.Add($btn)
    }

    [void]$mainStack.Children.Add($btnStack)
    $alertWin.Content = $mainStack
    
    [void]$alertWin.ShowDialog()
    return $alertWin.Tag
}

# ------------------------------------------------------------------------------
# 状态栏函数 (包含 Set-Status 和 Reset-Status)
# ------------------------------------------------------------------------------

# 1. 设置状态 (自动读取中文前缀)
Function Set-Status($text) { 
    $prefix = $Script:CurrentLangConfig.UI.Status.Processing
    if (-not $prefix) { $prefix = "Processing:" }
    $window.FindName("StatusBarText").Text = "$prefix $text..." 
    [System.Windows.Forms.Application]::DoEvents() 
}

# 2. 重置状态 (你之前缺失的函数)
Function Reset-Status { 
    $ready = $Script:CurrentLangConfig.UI.Status.Ready
    if (-not $ready) { $ready = "Ready." }
    $window.FindName("StatusBarText").Text = $ready
}

# ------------------------------------------------------------------------------
# 内置默认语言 (English) (修复了PSCustomObject与Hashtable兼容性)
# ------------------------------------------------------------------------------
$BuiltInLang = @{
    LanguageName = "English (Default)"
    Author       = "Rex"
    UI           = @{
        Title    = "OpsKit v1.2 - Pro" 
        SubTitle = "Designed by Rex"
        
        Tabs     = @{ 
            Net  = "🌐 Network"
            Sys  = "🖥️ System"
            Hard = "🖨️ Hardware" 
        }

        Status   = @{
            Ready      = "Ready. Select a category to begin."
            Processing = "Processing:"
        }

        Buttons  = @{
            BtnNetReset        = @{Title = "Reset Network Stack"; Desc = "Flush DNS and reset Winsock to fix connectivity" }
            BtnWifiReveal      = @{Title = "Show WiFi Passwords"; Desc = "Display saved security keys for all profiles" }
            BtnUnlockBrowser   = @{Title = "Unlock Browser Policy"; Desc = "Remove 'Managed by your organization' restriction" }
            BtnResetHosts      = @{Title = "Restore Hosts File"; Desc = "Reset system Hosts to default to fix access issues" }
            BtnFixSmb          = @{Title = "Fix LAN Sharing"; Desc = "Enable Discovery / SMB services" }
    
            BtnFixIcons        = @{Title = "Rebuild Icon Cache"; Desc = "Fix broken or corrupted desktop/taskbar icons" }
            BtnRestartExplorer = @{Title = "Restart Windows Explorer"; Desc = "Restart shell to fix frozen taskbar" }
            BtnHighPerf        = @{Title = "Ultimate Performance"; Desc = "Enable the hidden high-performance power plan" } 
            BtnFixUpdate       = @{Title = "Fix Windows Update"; Desc = "Reset update components and clear download cache" }
            BtnWin11Menu       = @{Title = "Classic Context Menu"; Desc = "Restore Windows 10 style right-click menu" }
            BtnCleanDisk       = @{Title = "Disk Cleanup"; Desc = "Deep clean system temp files and cache" }
            
            BtnFixPrintSvc     = @{Title = "Repair Print Spooler"; Desc = "Clear stuck print queue and restart service" }
            BtnFixPrint11b     = @{Title = "Fix Printer Error 0x11b"; Desc = "Resolve network printer sharing connection issues" }
            BtnSsdTrim         = @{Title = "Optimize All SSDs"; Desc = "Force TRIM command to maintain SSD performance" }
            BtnDiskSmart       = @{Title = "Disk Health Status"; Desc = "Read S.M.A.R.T. data to check drive reliability" }
            BtnSysRepair       = @{Title = "Deep System Repair"; Desc = "Comprehensive SFC and DISM health check (Slow)" } 
        }
        
        Sim      = @{
            # --- 网络类 ---
            Wifi       = @{ Title = "WiFi Passwords Extracted"; Msg = "✅ Success!`n`nTo make it easier for you to copy and view,`nI have organized all WiFi passwords into a Notepad file and opened it for you." }
            NetReset   = @{ Title = "Network Reset Complete"; Msg = "✅ Network stack has been reset successfully!`n`nA system restart is recommended to apply all changes.`n`nWould you like to restart now?"; BtnYes = "Restart Now"; BtnNo = "Later" }
            SmbFix     = @{ Title = "LAN Sharing Fixed"; Msg = "✅ LAN environment optimized!`n`n1. Services: Network Discovery & Resource Publication enabled.`n2. Firewall: Rules for File and Printer Sharing updated.`n`n👉 If still not visible, please check Advanced Sharing Settings." }
            Hosts      = @{ 
                Title = "Hosts Manager"; Msg = "Please select an action:`n`n[ Reset ] ⏩ Reset to Default (Auto Backup)`n`n[ Restore ] ⏪ Undo last change";
                BtnYes = "Reset Now"; BtnNo = "Restore"; BtnCancel = "Cancel";
                SuccessTitle = "Success"; SuccessMsg = "✅ Hosts has been reset!`n`nOriginal file saved as backup.`nYou can click 'RESTORE' next time to undo.";
                RestoreTitle = "Restored"; RestoreMsg = "✅ Undo Successful!`n`nYour previous Hosts file has been restored.";
                ErrorTitle = "Permission Denied"; ErrorMsg = "❌ Operation Failed!`n`nAccess to the file was denied.`n`n👉 Please run this tool as ADMINISTRATOR.`nOr check your Antivirus settings.";
                NoBackupTitle = "No Backup Found"; NoBackupMsg = "❌ Restore Failed!`n`nYou haven't reset the hosts using this tool yet, so there is no backup file available to restore."
            }
            Browser    = @{ 
                Title = "Browser Restrictions Removed"; Msg = "✅ 'Managed by organization' policies removed successfully!`n`n🛡️ 【Privacy Note】:`nThis operation only removes registry policy constraints. Your bookmarks, passwords, history, and cookies remain 【UNTOUCHED】.`n`n👉 Please manually restart all open browser windows.";
                Stat_Registry = "Scanning for management policies..."; Stat_Clean = "Resetting browser trust chain..."
            }

            # --- 系统类 ---
            Icons      = @{ 
                Title = "Icons Refreshed"; Msg = "✅ Icon database rebuilt successfully!`n`nSystem may take a few seconds to redraw the taskbar.`n`n👉 If issue persists, a full reboot is recommended.";
                Stat_Kill = "Stopping Explorer..."; Stat_Del = "Cleaning icon cache..."; Stat_Run = "Restarting shell..."
            }
            Exp        = @{ Title = "Environment Restarted"; Msg = "✅ Desktop environment has been re-initialized!`n`n1. Taskbar and system tray have been refreshed.`n2. Explorer.exe process has been reloaded.`n3. Hangs or slow response issues should be resolved.`n`n👉 If some tray icons are missing, you may need to restart those specific apps." }
            Flicker    = @{ Title = "Action Confirmation"; Msg = "⚠️ Note: This action will reset the desktop environment.`n`nYour taskbar and icons will disappear and 【FLICKER】 for a moment. This is normal.`n`nPlease save your work. Proceed?"; BtnYes = "Proceed"; BtnNo = "Cancel" }
            UpdateFix  = @{ Title = "Update Fix Finished"; Msg = "✅ Update components have been reset successfully!`n`nTo ensure the update service starts fresh,`n👉 a system restart is highly recommended." }
            MenuFix    = @{ 
                Title = "Context Menu Mode"; Msg = "✅ Registry configuration updated!`n`nTo apply the Classic/Modern menu toggle, Explorer must restart now.`n`n👉 Screen will 【FLICKER】; the taskbar will briefly disappear and reload. Please wait.";
                Stat_Reg = "Updating registry keys..."; Stat_Restart = "Force reloading desktop environment..."
            }
            Clean      = @{ 
                StartTitle = "Starting Cleanup"; 
                StartMsg   = "🧹 Disk Cleanup is about to start...\n\nOpsKit will scan and remove temporary files. This may take 10-60 seconds depending on junk size.\n\n👉 Click OK to begin.";
                Title      = "Disk Cleanup Finished"; 
                Msg        = "✅ System deep cleanup has been completed!`n`nTemporary files, cache, and recycle bin have been cleared.`n`nIt's recommended to run this regularly to free up space."
            }
            SysRep     = @{ 
                StartTitle = "Repair Started"; StartMsg = "🚀 Starting Deep Repair (SFC + DISM)...\n\nThis usually takes 10-20 mins. Please do not close the window.\nI will notify you once it's finished."; 
                Title = "System Repair Finished"; Msg = "✅ Scan and repair operations completed!`n`nScan complete, please check the log summary below.`n`nA system restart is recommended to apply all changes." 
            }
            Perf       = @{ Title = "Ultimate Performance"; Msg = "✅ Mode Activated!`n`nDuplicates have been cleaned up and the plan is forced active.`nYour system is now running at full speed." }

            # --- 硬件类 ---
            Trim       = @{ 
                Title = "Success"; Msg = "SSD TRIM command sent to all detected fixed drives.";
                ErrorTitle = "Optimization Failed"; ErrorMsg = "❌ Failed!`n`nPlease ensure you are running as Administrator and your drives support TRIM."
            }
            PrintSvc   = @{ Title = "Print Spooler Repaired"; Msg = "✅ Print queue has been cleared successfully!`n`n1. Spooler service restarted.`n2. Stuck print jobs removed from system.`n`n👉 You can now try printing again." }
            Print11b   = @{ 
                Title = "Printer Fix (0x11b/709)"; Msg = "Please select an action:`n`n[ Fix ] ⏩ Apply registry patches for network printing`n`n[ Undo ] ⏪ Remove patches and restore default security";
                BtnYes = "Apply Fix"; BtnNo = "Undo Fix"; BtnCancel = "Cancel";
                SuccessTitle = "Fix Applied"; SuccessMsg = "✅ Registry patches have been applied!`n`n👉 Please test your printer now. If it still fails, a restart is recommended.";
                RestoreTitle = "Settings Restored"; RestoreMsg = "✅ Undo Successful!`n`nPrinter registry patches have been removed."
            }
            SmartCheck = @{ 
                Title = "Disk Health Report"; HealthyMsg = "✅ All drives are operating normally!`n`nDetails:`n{0}";
                WarningTitle = "🚩 Risk Detected"; WarningMsg = "❌ Warning: Disk health issues detected!`n`nPlease backup your data immediately.`n`nDetails:`n{0}"
            }
            Error      = @{ Title = "Error" }
        }
    }
}

$CurrentLangConfig = $BuiltInLang 

Function Apply-Language-To-UI($langData) {
    # 1. 更新全局配置变量 (弹窗内容全靠它)
    $Script:CurrentLangConfig = $langData

    # 2. 更新主窗口标题和副标题
    if ($langData.UI.Title) { 
        $window.Title = $langData.UI.Title
        if ($window.FindName("TxtAppTitle")) { $window.FindName("TxtAppTitle").Text = $langData.UI.Title } 
    }
    if ($langData.UI.SubTitle) { 
        if ($window.FindName("TxtAppSub")) { $window.FindName("TxtAppSub").Text = $langData.UI.SubTitle } 
    }

    # 3. 更新选项卡 (Tab) 标题
    if ($langData.UI.Tabs) { 
        if ($window.FindName("TabNet")) { $window.FindName("TabNet").Header = $langData.UI.Tabs.Net }
        if ($window.FindName("TabSys")) { $window.FindName("TabSys").Header = $langData.UI.Tabs.Sys }
        if ($window.FindName("TabHard")) { $window.FindName("TabHard").Header = $langData.UI.Tabs.Hard }
    }
    
    # 4. 更新按钮文字
    $Btns = $langData.UI.Buttons

    # 自动判断数据类型来获取 Keys (Object vs Hashtable)
    # 如果是内置 $BuiltInLang，它是 Hashtable，用 .Keys
    # 如果是外部 json 文件，它是 PSCustomObject，用 .PSObject.Properties.Name
    if ($Btns -is [System.Collections.Hashtable]) { 
        $keys = $Btns.Keys 
    }
    else { 
        $keys = $Btns.PSObject.Properties.Name 
    }

    # 5. 循环更新每个按钮的标题和描述
    foreach ($key in $keys) {
        $t = $window.FindName("Txt${key}_T") # 找标题控件 (如 TxtBtnNetReset_T)
        $d = $window.FindName("Txt${key}_D") # 找描述控件 (如 TxtBtnNetReset_D)
        $item = $Btns.$key
        
        if ($t) { $t.Text = $item.Title }
        if ($d) { $d.Text = $item.Desc }
    }

    # 6. 重置状态栏文字
    Reset-Status
}
Function Init-Language-System {
    $BaseDir = ([System.AppDomain]::CurrentDomain.BaseDirectory)
    $LangDir = Join-Path $BaseDir "lang"
    if (Test-Path $LangDir) {
        Get-ChildItem -Path $LangDir -Filter "*.json" | ForEach-Object {
            try {
                $j = Get-Content $_.FullName -Raw -Encoding UTF8 | ConvertFrom-Json
                $i = New-Object System.Windows.Controls.ComboBoxItem; $i.Content = $j.LanguageName; $i.Tag = $_.FullName
                [void]$window.FindName("CmbLang").Items.Add($i)
            }
            catch {}
        }
    }
}
$window.FindName("CmbLang").Add_SelectionChanged({
        $tag = $this.SelectedItem.Tag
        if ($tag -eq "Default") { Apply-Language-To-UI $BuiltInLang } else { try { Apply-Language-To-UI (Get-Content $tag -Raw -Encoding UTF8 | ConvertFrom-Json) } catch {} }
    })

# ------------------------------------------------------------------------------
# 3. 按钮事件 (完整功能)
# ------------------------------------------------------------------------------

# 1. Network Reset
$window.FindName("BtnNetReset").Add_Click({
        Set-Status "Resetting Network Stack..."
    
        # 1. 执行重置命令
        netsh winsock reset | Out-Null
        netsh int ip reset | Out-Null
        ipconfig /release | Out-Null
        ipconfig /renew | Out-Null
        ipconfig /flushdns | Out-Null

        # 2. 【场景 A 放置处】：准备弹窗配置并调用
        $N = $Script:CurrentLangConfig.UI.Sim.NetReset
        $Config = @{
            Buttons = @(
                @{ Text = $N.BtnNo; Bg = "#E5E5EA"; Fg = "#1D1D1F"; Value = "Later" },
                @{ Text = $N.BtnYes; Bg = "#007AFF"; Fg = "White"; Value = "Restart" }
            )
        }
    
        # 调用万能弹窗
        $Choice = Show-ProDialog $N.Title $N.Msg $Config
    
        # 3. 根据返回值执行操作
        if ($Choice -eq "Restart") {
            Restart-Computer -Force
        }
    
        Reset-Status
    })

# 2. WiFi Reveal
$window.FindName("BtnWifiReveal").Add_Click({
        Set-Status "Scanning WiFi Profiles..."
    
        # 1. 扫描所有 WiFi 配置文件
        # (用 UTF8 编码处理，防止中文 WiFi 名乱码)
        $Profiles = netsh wlan show profiles | Select-String "All User Profile" | ForEach-Object { $_.ToString().Split(":")[1].Trim() }
    
        if (-not $Profiles) {
            Show-AppleAlert "WiFi Password" "No WiFi profiles found."
            Reset-Status
            return
        }

        # 2. 拼接漂亮的报告内容
        $Report = New-Object System.Text.StringBuilder
        [void]$Report.AppendLine("========================================")
        [void]$Report.AppendLine("       WiFi Password Recovery Report    ")
        [void]$Report.AppendLine("========================================")
        [void]$Report.AppendLine("")

        foreach ($Profile in $Profiles) {
            $Output = netsh wlan show profile name="$Profile" key=clear
            $PassLine = $Output | Select-String "Key Content"
        
            if ($PassLine) {
                $Pass = $PassLine.ToString().Split(":")[1].Trim()
            }
            else {
                $Pass = "[ No Password / Open Network ]"
            }
            [void]$Report.AppendLine("WIFI Name : $Profile")
            [void]$Report.AppendLine("Password  : $Pass")
            [void]$Report.AppendLine("----------------------------------------")
        }

        # 3. 输出到临时文件并打开
        $TempFile = [System.IO.Path]::GetTempFileName() + ".txt"
        $Report.ToString() | Out-File -FilePath $TempFile -Encoding UTF8
    
        # 启动记事本打开它
        Start-Process "notepad.exe" $TempFile
    
        # 界面上也给个简单提示，告诉用户发生了什么
        Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.Wifi.Title $Script:CurrentLangConfig.UI.Sim.Wifi.Msg
    
        Reset-Status
    })


# 3. 浏览器策略解锁 (Chrome/Edge 组织管理解除)
$window.FindName("BtnUnlockBrowser").Add_Click({
        $B = $Script:CurrentLangConfig.UI.Sim.Browser
        Set-Status $B.Stat_Registry
    
        try {
            # 定义需要清理的注册表路径
            $PolicyPaths = @(
                "HKLM:\SOFTWARE\Policies\Google\Chrome",
                "HKLM:\SOFTWARE\Policies\Microsoft\Edge",
                "HKCU:\SOFTWARE\Policies\Google\Chrome",
                "HKCU:\SOFTWARE\Policies\Microsoft\Edge"
            )

            foreach ($Path in $PolicyPaths) {
                if (Test-Path $Path) {
                    Set-Status "$($B.Stat_Clean) -> $Path"
                    Remove-Item -Path $Path -Recurse -Force -ErrorAction SilentlyContinue
                }
            }

            # 模拟深度扫描感，增强 Pro 体验
            Start-Sleep -Milliseconds 1200
        
            # 4. 弹出带有隐私声明的置顶框
            Show-AppleAlert $B.Title $B.Msg
        }
        catch {
            Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.Hosts.ErrorTitle $Script:CurrentLangConfig.UI.Sim.Hosts.ErrorMsg
        }
    
        Reset-Status
    })
# ------------------------------------------------------------------------------
# 4. 重置 / 还原 Hosts (万能弹窗 + 防弹整合版)
$window.FindName("BtnResetHosts").Add_Click({
        Set-Status "Managing Hosts File..."

        # 定义路径
        $HostsDir = "$env:SystemRoot\System32\drivers\etc"
        $HostsPath = "$HostsDir\hosts"
        $UndoFile = "$HostsDir\hosts.OpsKit.Undo"
    
        # 获取语言包引用
        $H = $Script:CurrentLangConfig.UI.Sim.Hosts

        try {
            # 1. 【核心：配置三按钮万能弹窗】
            $Config = @{
                Buttons = @(
                    # 取消按钮 (灰色)
                    @{ Text = $H.BtnCancel; Bg = "#E5E5EA"; Fg = "#1D1D1F"; Value = "Cancel" },
                    # 还原按钮 (绿色 - 对应 No 分支)
                    @{ Text = $H.BtnNo; Bg = "#34C759"; Fg = "White"; Value = "No" },
                    # 重置按钮 (蓝色 - 对应 Yes 分支)
                    @{ Text = $H.BtnYes; Bg = "#007AFF"; Fg = "White"; Value = "Yes" }
                )
            }

            # 调用万能弹窗
            $UserChoice = Show-ProDialog $H.Title $H.Msg $Config

            # 如果点击取消或直接关闭窗口，则退出
            if ($UserChoice -eq 'Cancel' -or $null -eq $UserChoice) { 
                Reset-Status
                return 
            }

            # 2. 【防护：强制移除属性】
            if (Test-Path $HostsPath) {
                $FileItem = Get-Item $HostsPath
                if ($FileItem.IsReadOnly) { $FileItem.IsReadOnly = $false }
                if ($FileItem.Attributes -band [System.IO.FileAttributes]::Hidden) {
                    $FileItem.Attributes = $FileItem.Attributes -bxor [System.IO.FileAttributes]::Hidden
                }
            }

            # --- 分支 A: 重置 (Yes) ---
            if ($UserChoice -eq 'Yes') {
                Set-Status "Backing up & Resetting..."
            
                # A1. 制作后悔药
                if (Test-Path $HostsPath) {
                    Copy-Item -Path $HostsPath -Destination $UndoFile -Force
                }

                # A2. 永久时间戳备份
                $Timestamp = Get-Date -Format 'yyyyMMdd-HHmmss'
                Copy-Item -Path $HostsPath -Destination "$HostsDir\hosts.bak.$Timestamp" -Force

                # A3. 写入内容 (ASCII 编码防止乱码)
                $CleanContent = @"
# Copyright (c) 1993-2009 Microsoft Corp.
# Reset by OpsKit Pro
127.0.0.1       localhost
::1             localhost
"@
                $CleanContent | Out-File -FilePath $HostsPath -Encoding ascii -Force
            
                # 结果提示
                Show-AppleAlert $H.SuccessTitle $H.SuccessMsg
            }
        
            # --- 分支 B: 还原 (No) ---
            elseif ($UserChoice -eq 'No') {
                Set-Status "Restoring Backup..."

                if (Test-Path $UndoFile) {
                    Copy-Item -Path $UndoFile -Destination $HostsPath -Force
                    Show-AppleAlert $H.RestoreTitle $H.RestoreMsg
                }
                else {
                    # 找不到备份时的多语言提示
                    Show-AppleAlert $H.NoBackupTitle $H.NoBackupMsg
                }
            }
        }
        catch {
            # 捕获权限或文件锁定等错误
            Show-AppleAlert $H.ErrorTitle $H.ErrorMsg
        }

        Reset-Status
    })

# 5. Fix SMB (置顶增强版)
$window.FindName("BtnFixSmb").Add_Click({
        $S = $Script:CurrentLangConfig.UI.Sim.SmbFix
        Set-Status "Enabling Discovery & SMB Services..."

        # 1. 开启关键服务：功能发现提供程序主机 & 发布
        # 这些服务决定了电脑能否在局域网列表里“露脸”
        $Services = @("fdPHost", "FDResPub")
        foreach ($Svc in $Services) {
            Set-Service -Name $Svc -StartupType Automatic -ErrorAction SilentlyContinue
            Start-Service -Name $Svc -ErrorAction SilentlyContinue
        }

        Set-Status "Updating Firewall Rules..."
        # 2. 开启防火墙规则：文件和打印机共享
        # 注意：这步最容易触发系统拦截提示
        netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes | Out-Null

        # 3. 【核心：调用置顶弹窗】
        # 由于 Show-AppleAlert 具备 Topmost 属性且位置偏左，它能有效盖过系统残留的权限警告
        Show-AppleAlert $S.Title $S.Msg

        Reset-Status
    })

# 6. Fix Icons (带闪烁预警的修复版)
$window.FindName("BtnFixIcons").Add_Click({
        $F = $Script:CurrentLangConfig.UI.Sim.Flicker
        $I = $Script:CurrentLangConfig.UI.Sim.Icons

        # 1. 弹出苹果风预警框 (告知会闪烁)
        $Config = @{
            Buttons = @(
                @{ Text = $F.BtnNo; Bg = "#E5E5EA"; Fg = "#1D1D1F"; Value = "No" },
                @{ Text = $F.BtnYes; Bg = "#FF3B30"; Fg = "White"; Value = "Yes" }
            )
        }
        $Choice = Show-ProDialog $F.Title $F.Msg $Config

        # 2. 用户确认后执行深度修复
        if ($Choice -eq "Yes") {
            try {
                # 步骤 A: 杀进程
                Set-Status $I.Stat_Kill
                Stop-Process -ProcessName explorer -Force -ErrorAction SilentlyContinue
                Start-Sleep -Milliseconds 500
            
                # 步骤 B: 删缓存
                Set-Status $I.Stat_Kill
                $CachePath = "$env:LOCALAPPDATA\IconCache.db"
                if (Test-Path $CachePath) {
                    Remove-Item $CachePath -Force -ErrorAction SilentlyContinue
                }
                # 同时清理缩略图缓存 (更彻底)
                Get-ChildItem "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*.db" -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
            
                # 步骤 C: 重启进程
                Set-Status $I.Stat_Run
                Start-Process explorer
            
                # 3. 弹出最终置顶成功通知
                Show-AppleAlert $I.Title $I.Msg 
            }
            catch { 
                Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.Hosts.ErrorTitle $Script:CurrentLangConfig.UI.Sim.Hosts.ErrorMsg 
            }
            Reset-Status
        }
    })


# 7. Restart Explorer (带预警反馈版)
$window.FindName("BtnRestartExplorer").Add_Click({
        $F = $Script:CurrentLangConfig.UI.Sim.Flicker
        $E = $Script:CurrentLangConfig.UI.Sim.Exp

        # 1. 弹出红色预警 (已在之前步骤完成)
        $Config = @{ Buttons = @(@{Text = $F.BtnNo; Bg = "#E5E5EA"; Fg = "#1D1D1F"; Value = "No" }, @{Text = $F.BtnYes; Bg = "#FF3B30"; Fg = "White"; Value = "Yes" }) }
        if ((Show-ProDialog $F.Title $F.Msg $Config) -eq "Yes") {
        
            # 2. 状态栏显示三个步骤，让用户觉得工具很有力量
            Set-Status "Terminating unresponsive shell..."
            Stop-Process -ProcessName explorer -Force -ErrorAction SilentlyContinue
            Start-Sleep -Milliseconds 600
        
            Set-Status "Re-initializing desktop layout..."
            Start-Process explorer
        
            # 3. 弹出升级后的 Pro 级通知
            Show-AppleAlert $E.Title $E.Msg
            Reset-Status
        }
    })
# ------------------------------------------------------------------------------
# 8. 卓越性能模式 (自动清洗 + 智能防重版)
# ------------------------------------------------------------------------------
$window.FindName("BtnHighPerf").Add_Click({
        Set-Status "Configuring Ultimate Performance..."

        # 1. 获取所有电源计划列表
        $PowerList = powercfg -list
    
        # 2. 搜索已存在的"Ultimate Performance" (兼容英文和中文名)
        $TargetPlans = $PowerList | Where-Object { ($_ -match "Ultimate Performance") -or ($_ -match "卓越性能") }
    
        $ActiveGUID = $null

        if ($TargetPlans) {
            # --- A. 发现已存在 (无论有几个) ---
        
            # 提取所有匹配到的 GUID (使用正则提取)
            $ExistingGUIDs = @()
            foreach ($line in $TargetPlans) {
                if ($line -match "([a-f0-9]{8}-([a-f0-9]{4}-){3}[a-f0-9]{12})") {
                    $ExistingGUIDs += $matches[0]
                }
            }

            # 选中第一个作为"正宫"
            $ActiveGUID = $ExistingGUIDs[0]
            powercfg -setactive $ActiveGUID
            
            # 【优化】不再使用弹框显示 GUID，改为在状态栏静默提示（或直接删除这行）
            Set-Status "Plan Activated: $ActiveGUID"

            # 【自动清洗】如果多于1个，把剩下的全部删掉！
            if ($ExistingGUIDs.Count -gt 1) {
                for ($i = 1; $i -lt $ExistingGUIDs.Count; $i++) {
                    $TrashGUID = $ExistingGUIDs[$i]
                    powercfg -delete $TrashGUID
                    Write-Host "Deleted duplicate plan: $TrashGUID"
                }
            }
        }
        else {
            # --- B. 完全没有，新建一个 ---
            $TemplateGUID = "e9a42b02-d5df-448d-aa00-03f14749eb61"
            powercfg -duplicatescheme $TemplateGUID | Out-Null
        
            # 再次获取列表以找到刚生成的新 GUID
            $NewList = powercfg -list
            $NewLine = $NewList | Where-Object { ($_ -match "Ultimate Performance") -or ($_ -match "卓越性能") } | Select-Object -First 1
        
            if ($NewLine -match "([a-f0-9]{8}-([a-f0-9]{4}-){3}[a-f0-9]{12})") {
                $ActiveGUID = $matches[0]
                powercfg -setactive $ActiveGUID
            }
        }

        # 3. 打开面板让用户确认
        Start-Process "powercfg.cpl"
    
        Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.Perf.Title $Script:CurrentLangConfig.UI.Sim.Perf.Msg
    
        Reset-Status
    })


# 9. Fix Updates (静默优化版 - 彻底消除黄色弹窗)
$window.FindName("BtnFixUpdate").Add_Click({
        $U = $Script:CurrentLangConfig.UI.Sim.UpdateFix
    
        # 1. 停止服务 (状态栏显示进度)
        $Services = @("wuauserv", "bits", "cryptsvc", "msiserver")
        foreach ($Svc in $Services) {
            Set-Status "Stopping service: $Svc"
            # 停止服务时通常不需要 WarningAction，但加上更保险
            Stop-Service -Name $Svc -Force -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
        }

        # 2. 清理缓存
        Set-Status "Clearing update cache..."
        $SDPath = "$env:SystemRoot\SoftwareDistribution"
        if (Test-Path $SDPath) {
            Remove-Item $SDPath -Recurse -Force -ErrorAction SilentlyContinue | Out-Null
        }
    
        # 顺便清理 catroot2 (可选优化)
        $CatPath = "$env:SystemRoot\System32\catroot2"
        if (Test-Path $CatPath) {
            Remove-Item $CatPath -Recurse -Force -ErrorAction SilentlyContinue | Out-Null
        }

        # 3. 重启服务 (关键修改：加入 -WarningAction SilentlyContinue)
        foreach ($Svc in $Services) {
            Set-Status "Starting service: $Svc"
        
            # 这一步是消除黄色弹窗的关键！
            Set-Service -Name $Svc -StartupType Automatic -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            Start-Service -Name $Svc -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
        }

        # 4. 只有最后成功了，才弹这一个漂亮的苹果风提示框
        Show-AppleAlert $U.Title $U.Msg

        Reset-Status
    })

# 10. Win11 菜单模式切换 (经典/现代切换)
$window.FindName("BtnWin11Menu").Add_Click({
        $F = $Script:CurrentLangConfig.UI.Sim.Flicker
        $M = $Script:CurrentLangConfig.UI.Sim.MenuFix
    
        # 1. 弹出红色预警：告知屏幕会闪烁
        $Config = @{
            Buttons = @(
                @{ Text = $F.BtnNo; Bg = "#E5E5EA"; Fg = "#1D1D1F"; Value = "No" },
                @{ Text = $F.BtnYes; Bg = "#FF3B30"; Fg = "White"; Value = "Yes" }
            )
        }
    
        $Choice = Show-ProDialog $F.Title $F.Msg $Config
    
        if ($Choice -eq "Yes") {
            try {
                Set-Status $M.Stat_Reg
                $RegPath = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"
            
                # 自动切换逻辑：如果路径存在则删除(回现代)，不存在则创建(去经典)
                if (Test-Path $RegPath) {
                    Remove-Item "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" -Recurse -Force
                }
                else {
                    New-Item -Path $RegPath -Force | Out-Null
                    Set-ItemProperty -Path $RegPath -Name "(Default)" -Value ""
                }

                # 2. 重启资源管理器
                Set-Status $M.Stat_Restart
                Stop-Process -ProcessName explorer -Force -ErrorAction SilentlyContinue
                Start-Sleep -Milliseconds 800
                Start-Process explorer
            
                # 3. 弹出置顶成功通知
                Show-AppleAlert $M.Title $M.Msg
            }
            catch {
                Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.Hosts.ErrorTitle $Script:CurrentLangConfig.UI.Sim.Hosts.ErrorMsg
            }
            Reset-Status
        }
    })

# 16. Disk Cleanup (带启动预警的体验优化版)
$window.FindName("BtnCleanDisk").Add_Click({
    $C = $Script:CurrentLangConfig.UI.Sim.Clean
    
    # 1. 【新增】启动前先弹窗告知，让用户有心理准备
    Show-AppleAlert $C.StartTitle $C.StartMsg

    # 2. 用户点 OK 后，状态栏开始跑
    Set-Status "Initializing Disk Cleanup utility..."
    Start-Sleep -Milliseconds 500 # 给个视觉缓冲
    Set-Status "Scanning and removing junk files (Please wait)..."
    
    # 3. 执行清理 (使用 -Wait 等待其结束)
    # /LOWDISK 模式会自动扫描并清理，几乎不需要用户干预，但会有进度条显示
    # 或者继续用 之前的 /autoclean
    Start-Process "cleanmgr.exe" -ArgumentList "/autoclean /d $env:SystemDrive" -Wait

    # 4. 清理结束，弹出成功提示
    Show-AppleAlert $C.Title $C.Msg

    Reset-Status
})


# 11. Fix Spooler (深度清理版)
$window.FindName("BtnFixPrintSvc").Add_Click({
        $P = $Script:CurrentLangConfig.UI.Sim.PrintSvc
        Set-Status "Cleaning Spooler..."

        try {
            # 1. 强行停止打印服务
            Stop-Service -Name Spooler -Force -ErrorAction SilentlyContinue

            # 2. 物理删除积压的打印文件 (这是修复“死任务”的关键)
            $SpoolPath = "$env:SystemRoot\System32\spool\PRINTERS\*"
            if (Test-Path $SpoolPath) {
                Remove-Item $SpoolPath -Force -ErrorAction SilentlyContinue | Out-Null
            }

            # 3. 重新启动服务
            Start-Service -Name Spooler -ErrorAction SilentlyContinue

            # 4. 调用置顶大弹窗
            Show-AppleAlert $P.Title $P.Msg
        }
        catch {
            # 如果权限不足或文件被占用，调用通用错误提示
            Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.Hosts.ErrorTitle $Script:CurrentLangConfig.UI.Sim.Hosts.ErrorMsg
        }

        Reset-Status
    })

# 12. Fix 11b & 709 (万能弹窗版)
$window.FindName("BtnFixPrint11b").Add_Click({
        Set-Status "Managing Printer Patch..."
    
        $RegPath = "HKLM:\System\CurrentControlSet\Control\Print"
        $P = $Script:CurrentLangConfig.UI.Sim.Print11b

        try {
            # 1. 【场景 B 放置处】：准备三按钮配置
            $Config = @{
                Buttons = @(
                    @{ Text = $P.BtnCancel; Bg = "#E5E5EA"; Fg = "#1D1D1F"; Value = "Cancel" },
                    @{ Text = $P.BtnNo; Bg = "#34C759"; Fg = "White"; Value = "No" },
                    @{ Text = $P.BtnYes; Bg = "#007AFF"; Fg = "White"; Value = "Yes" }
                )
            }
        
            $Choice = Show-ProDialog $P.Title $P.Msg $Config
        
            if ($Choice -eq "Cancel" -or $null -eq $Choice) { Reset-Status; return }

            # --- 分支执行 ---
            if ($Choice -eq "Yes") {
                Set-Status "Applying Patches..."
                New-ItemProperty -Path $RegPath -Name "RpcAuthnLevelPrivacyEnabled" -Value 0 -PropertyType DWORD -Force | Out-Null
                New-ItemProperty -Path $RegPath -Name "DnsOnWire" -Value 1 -PropertyType DWORD -Force | Out-Null
                Show-AppleAlert $P.SuccessTitle $P.SuccessMsg
            }
            elseif ($Choice -eq "No") {
                Set-Status "Removing Patches..."
                Remove-ItemProperty -Path $RegPath -Name "RpcAuthnLevelPrivacyEnabled" -ErrorAction SilentlyContinue
                Remove-ItemProperty -Path $RegPath -Name "DnsOnWire" -ErrorAction SilentlyContinue
                Show-AppleAlert $P.RestoreTitle $P.RestoreMsg
            }
        }
        catch {
            # 统一调用 Hosts 块里的权限错误文案
            Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.Hosts.ErrorTitle $Script:CurrentLangConfig.UI.Sim.Hosts.ErrorMsg
        }
    
        Reset-Status
    })

# 13. SSD TRIM (全盘自动识别 + 多语言纠错版)
$window.FindName("BtnSsdTrim").Add_Click({
        # 【核心修正】在进入 try 之前定义变量，确保全局可用
        $T = $Script:CurrentLangConfig.UI.Sim.Trim
    
        # 状态栏也建议用变量 (如果 JSON 里配了的话)
        Set-Status "Running TRIM" 

        try {
            # 获取所有带盘符的固定磁盘卷，并逐一执行 ReTrim
            $targetVolumes = Get-Volume | Where-Object { $_.DriveLetter -ne $null -and $_.DriveType -eq 'Fixed' }
        
            foreach ($vol in $targetVolumes) {
                # 只有 SSD 支持 ReTrim，如果是 HDD 这行会自动跳过或报错，被 catch 捕获
                Optimize-Volume -DriveLetter $vol.DriveLetter -ReTrim | Out-Null
            }

            # 优化完成后，使用定义的 $T 弹出苹果风置顶大框
            Show-AppleAlert $T.Title $T.Msg 
        }
        catch { 
            # 这里的 $T 现在能被正确识别了
            Show-AppleAlert $T.ErrorTitle $T.ErrorMsg 
        }
    
        Reset-Status
    })


# 14. SMART Check (深度体检版)
$window.FindName("BtnDiskSmart").Add_Click({
        Set-Status "Scanning physical drives..."
        $S = $Script:CurrentLangConfig.UI.Sim.SmartCheck
    
        # 1. 获取所有物理磁盘的明细
        $Disks = Get-PhysicalDisk | Select-Object FriendlyName, HealthStatus, Size
        $Report = ""
        $HasIssue = $false

        # 2. 遍历磁盘，构建清单
        foreach ($Disk in $Disks) {
            $GB = [Math]::Round($Disk.Size / 1GB, 0)
            $Report += "• $($Disk.FriendlyName) ($($GB)GB) -> [$($Disk.HealthStatus)]`n"
            if ($Disk.HealthStatus -ne "Healthy") { $HasIssue = $true }
        }

        # 3. 根据结果调用置顶大弹窗
        if ($HasIssue) {
            # 使用 -f 操作符，将 $Report 填入文案中的 {0} 位置
            Show-AppleAlert $S.WarningTitle ($S.WarningMsg -f $Report)
        }
        else {
            Show-AppleAlert $S.Title ($S.HealthyMsg -f $Report)
        }
    
        Reset-Status
    })

# 15. Sys Repair (增强置顶通知版)
$window.FindName("BtnSysRepair").Add_Click({
        $S = $Script:CurrentLangConfig.UI.Sim.SysRep
    
        # 1. 开始前弹出置顶框告知用户预计时长
        Show-AppleAlert $S.StartTitle $S.StartMsg
    
        Set-Status "Running DISM (Step 1/2)"
        # 执行 DISM 修复
        Start-Process -FilePath "dism.exe" -ArgumentList "/Online /Cleanup-Image /RestoreHealth" -Wait -NoNewWindow
    
        Set-Status "Running SFC (Step 2/2)"
        # 执行 SFC 扫描
        Start-Process -FilePath "sfc.exe" -ArgumentList "/scannow" -Wait -NoNewWindow
    
        # 2. 任务结束，弹出置顶大框 (包含你要求的日志摘要提醒)
        Show-AppleAlert $S.Title $S.Msg
    
        Reset-Status
    })

# ------------------------------------------------------------------------------
# 4. 初始化与启动
# ------------------------------------------------------------------------------

# 初始化语言列表
Init-Language-System

# ==============================================================================
# [智能语言适配 - OpsKit v1.2 最终通用版]
# 逻辑：先找精确匹配 (如 fr-FR)，找不到就找模糊匹配 (如 fr-CA -> 自动用 fr-FR)
# ==============================================================================

# 1. 获取当前系统的语言代码
$SysCode = [System.Globalization.CultureInfo]::CurrentUICulture.Name  # 例如: fr-CA

# 2. 第一轮尝试：精确匹配 (找 fr-CA.json)
$MatchItem = $window.FindName("CmbLang").Items | Where-Object {
    $_.Tag -ne "Default" -and (Split-Path $_.Tag -Leaf) -eq "$SysCode.json"
}

# 3. 如果没找到，进入第二轮：模糊匹配 (找 fr-*.json)
if (-not $MatchItem) {
    # 取前两个字母 (fr)
    $TwoLetter = $SysCode.Split("-")[0]
    # 找任何以 fr 开头的 json 文件
    $MatchItem = $window.FindName("CmbLang").Items | Where-Object {
        $_.Tag -ne "Default" -and (Split-Path $_.Tag -Leaf) -match "^$TwoLetter"
    } | Select-Object -First 1
}

# 4. 执行加载与最终兜底
if ($MatchItem) {
    # 找到了对应的多国语言 JSON
    $window.FindName("CmbLang").SelectedItem = $MatchItem
    try {
        $json = Get-Content $MatchItem.Tag -Raw -Encoding UTF8 | ConvertFrom-Json
        Apply-Language-To-UI $json
    }
    catch {}
}
else {
    # [关键修复点]：如果没有匹配到 JSON（包括系统本身就是英文的情况）
    # 强制将内建的 $BuiltInLang 刷新到 UI，确保显示的是你最新修改的专业版英文
    $window.FindName("CmbLang").SelectedIndex = 0  # 选中 English (Default)
    Apply-Language-To-UI $BuiltInLang
}

# 启动 (静音返回值)
[void]$window.ShowDialog()