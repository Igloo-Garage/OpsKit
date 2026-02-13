# ==============================================================================
# OpsKit v1.0 - Pro (Stable Release)
# Author: Rex | Date: 2026-02-12
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
        Title="OpsKit v1.0 - Pro" Height="960" Width="1280"
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
                <TextBlock x:Name="TxtAppTitle" Text="OpsKit v1.0" FontSize="32" FontWeight="Bold" Foreground="#1D1D1F"/>
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

            <TabItem x:Name="TabSys" Header="🖥️ System">
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
    $alertWin.Title = $Title; $alertWin.Width = 600; $alertWin.Height = 400
    $alertWin.WindowStartupLocation = "CenterScreen"; $alertWin.ResizeMode = "NoResize"
    $alertWin.Background = "#F5F5F7"; $alertWin.FontFamily = "Segoe UI, Microsoft YaHei"
    
    $stack = New-Object System.Windows.Controls.StackPanel; $stack.Margin = "30"
    $txtTitle = New-Object System.Windows.Controls.TextBlock
    $txtTitle.Text = $Title; $txtTitle.FontSize = 24; $txtTitle.FontWeight = "Bold"
    $txtTitle.Foreground = "#1D1D1F"; $txtTitle.Margin = "0,0,0,20"; $txtTitle.TextWrapping = "Wrap"
    $stack.Children.Add($txtTitle)

    $scroll = New-Object System.Windows.Controls.ScrollViewer; $scroll.Height = 200; $scroll.VerticalScrollBarVisibility = "Auto"
    $txtMsg = New-Object System.Windows.Controls.TextBox
    $txtMsg.Text = $Message; $txtMsg.FontSize = 16; $txtMsg.Foreground = "#333333"
    $txtMsg.Background = "Transparent"; $txtMsg.BorderThickness = 0; $txtMsg.TextWrapping = "Wrap"; $txtMsg.IsReadOnly = $true
    $scroll.Content = $txtMsg; $stack.Children.Add($scroll)

    $btnOK = New-Object System.Windows.Controls.Button
    $btnOK.Content = "OK"; $btnOK.FontSize = 16; $btnOK.Padding = "30,10"; $btnOK.Margin = "0,20,0,0"
    $btnOK.HorizontalAlignment = "Right"; $btnOK.Background = "#007AFF"; $btnOK.Foreground = "White"; $btnOK.Cursor = "Hand"
    $btnOK.Add_Click({ $alertWin.Close() }); $stack.Children.Add($btnOK)
    
    $alertWin.Content = $stack
    [void]$alertWin.ShowDialog()
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
    Author       = "ErShu"
    UI           = @{
        Title    = "OpsKit v1.0 - Pro" 
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
            # 网络类：突出“重置”与“找回”
            BtnNetReset        = @{Title = "Reset Network Stack"; Desc = "Flush DNS and reset Winsock to fix connectivity" }
            BtnWifiReveal      = @{Title = "Show WiFi Passwords"; Desc = "Display saved security keys for all profiles" }
            BtnUnlockBrowser   = @{Title = "Unlock Browser Policy"; Desc = "Remove 'Managed by your organization' restriction" }
            BtnResetHosts      = @{Title = "Restore Hosts File"; Desc = "Reset system Hosts to default to fix access issues" }
            BtnFixSmb          = @{Title = "Fix LAN Sharing"; Desc = "Enable Network Discovery and SMB services" }
    
            # 系统类：突出“功能恢复”
            BtnFixIcons        = @{Title = "Rebuild Icon Cache"; Desc = "Fix broken or corrupted desktop/taskbar icons" }
            BtnRestartExplorer = @{Title = "Restart Windows Explorer"; Desc = "Restart shell to fix frozen taskbar or desktop" }
            BtnHighPerf        = @{Title = "Ultimate Performance"; Desc = "Enable the hidden high-performance power plan" } 
            BtnFixUpdate       = @{Title = "Fix Windows Update"; Desc = "Reset update components and clear download cache" }
            BtnWin11Menu       = @{Title = "Classic Context Menu"; Desc = "Restore Windows 10 style right-click menu" }
    
            # 硬件与打印：突出“深度优化”
            BtnFixPrintSvc     = @{Title = "Repair Print Spooler"; Desc = "Clear stuck print queue and restart service" }
            BtnFixPrint11b     = @{Title = "Fix Printer Error 0x11b / 709"; Desc = "Resolve network printer sharing connection issues" }
            BtnSsdTrim         = @{Title = "Optimize All SSDs"; Desc = "Force TRIM command to maintain SSD performance" }
            BtnDiskSmart       = @{Title = "Disk Health Status"; Desc = "Read S.M.A.R.T. data to check drive reliability" }
            BtnSysRepair       = @{Title = "Deep System Repair"; Desc = "Comprehensive SFC and DISM health check (Slow)" } 
        }
        
        Sim      = @{
            Wifi      = @{ Title = "WiFi Keys" }
            Icons     = @{ Title = "Done"; Msg = "Icon cache rebuilt." }
            Exp       = @{ Title = "Done"; Msg = "Explorer restarted." }
            Trim      = @{ Title = "Success"; Msg = "SSD TRIM command sent to all detected fixed drives." }
            Print11b  = @{ Title = "Success"; Msg = "Patch applied. Please restart." }
            SysRep    = @{ Title = "Finished"; Msg = "Repair complete. Please restart." }
            NetReset  = @{ Title = "Network Reset"; Msg = "DNS flushed, Winsock reset." }
            SmbFix    = @{ Title = "SMB Fix"; Msg = "Network discovery & SMB enabled." }
            UpdateFix = @{ Title = "Update Fix"; Msg = "Cache cleared, services restarted." }
            MenuFix   = @{ Title = "Context Menu"; Msg = "Switched to Classic style." }
            PrintSvc  = @{ Title = "Print Spooler"; Msg = "Queue cleared, service restarted." }
            SmartOK   = @{ Title = "Disk Health"; Msg = "All disks are healthy." }
            SmartBad  = @{ Title = "Disk Warning"; Msg = "Health issues detected! Backup now." }
            Hosts     = @{ Title = "Success"; Msg = "Hosts file reset to default." }
            Browser   = @{ Title = "Success"; Msg = "Policies removed. Restart browser." }
            Perf      = @{ Title = "Success"; Msg = "Ultimate Performance unlocked." }
            Error     = @{ Title = "Error" }
        }
    }
}
$CurrentLangConfig = $BuiltInLang 

Function Apply-Language-To-UI($langData) {
    $Script:CurrentLangConfig = $langData
    if ($langData.UI.Title) { $window.Title = $langData.UI.Title; if ($window.FindName("TxtAppTitle")) { $window.FindName("TxtAppTitle").Text = $langData.UI.Title } }
    if ($langData.UI.SubTitle) { if ($window.FindName("TxtAppSub")) { $window.FindName("TxtAppSub").Text = $langData.UI.SubTitle } }
    if ($langData.UI.Tabs) { 
        if ($window.FindName("TabNet")) { $window.FindName("TabNet").Header = $langData.UI.Tabs.Net }
        if ($window.FindName("TabSys")) { $window.FindName("TabSys").Header = $langData.UI.Tabs.Sys }
        if ($window.FindName("TabHard")) { $window.FindName("TabHard").Header = $langData.UI.Tabs.Hard }
    }
    
    $Btns = $langData.UI.Buttons
    # [关键修复] 自动判断数据类型来获取 Keys (Object vs Hashtable)
    if ($Btns -is [System.Collections.Hashtable]) { $keys = $Btns.Keys } else { $keys = $Btns.PSObject.Properties.Name }

    foreach ($key in $keys) {
        $t = $window.FindName("Txt${key}_T"); $d = $window.FindName("Txt${key}_D")
        $item = $Btns.$key
        if ($t) { $t.Text = $item.Title }
        if ($d) { $d.Text = $item.Desc }
    }
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
        Set-Status "Resetting Network"
        ipconfig /flushdns | Out-Null
        netsh winsock reset | Out-Null
        netsh int ip reset | Out-Null
        Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.NetReset.Title $Script:CurrentLangConfig.UI.Sim.NetReset.Msg
        Reset-Status
    })

# 2. WiFi Reveal
$window.FindName("BtnWifiReveal").Add_Click({
        Set-Status "Checking WiFi"
        $Profiles = netsh wlan show profiles | Select-String "All User Profile" | ForEach-Object { $_.ToString().Split(":")[1].Trim() }
        if (-not $Profiles) { Show-AppleAlert "Info" "No WiFi profiles found."; return }
        $Result = @(); foreach ($Profile in $Profiles) {
            $Pass = (netsh wlan show profile name="$Profile" key=clear | Select-String "Key Content")
            if ($Pass) { $Pass = $Pass.ToString().Split(":")[1].Trim() } else { $Pass = "(No Password)" }
            $Result += "$Profile  :  $Pass`r`n"
        }
        Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.Wifi.Title ([string]::Join("", $Result))
        Reset-Status
    })

# 3. Unlock Browser
$window.FindName("BtnUnlockBrowser").Add_Click({
        Set-Status "Removing Policies"
        $Paths = @("HKLM:\SOFTWARE\Policies\Google\Chrome", "HKLM:\SOFTWARE\Policies\Microsoft\Edge", "HKCU:\SOFTWARE\Policies\Google\Chrome", "HKCU:\SOFTWARE\Policies\Microsoft\Edge")
        foreach ($Path in $Paths) { if (Test-Path $Path) { Remove-Item -Path $Path -Recurse -Force -ErrorAction SilentlyContinue | Out-Null } }
        Start-Process "gpupdate" -ArgumentList "/force" -NoNewWindow -Wait
        Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.Browser.Title $Script:CurrentLangConfig.UI.Sim.Browser.Msg
        Reset-Status
    })

# 4. Reset Hosts
$window.FindName("BtnResetHosts").Add_Click({
        Set-Status "Resetting Hosts"
        try {
            "127.0.0.1 localhost`r`n::1 localhost" | Set-Content "$env:SystemRoot\System32\drivers\etc\hosts" -Force
            Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.Hosts.Title $Script:CurrentLangConfig.UI.Sim.Hosts.Msg 
        }
        catch { Show-AppleAlert "Error" "Run as Admin." }
        Reset-Status
    })

# 5. Fix SMB
$window.FindName("BtnFixSmb").Add_Click({
        Set-Status "Fixing SMB"
        Set-Service -Name "fdPHost" -StartupType Automatic; Start-Service "fdPHost" | Out-Null
        Set-Service -Name "FDResPub" -StartupType Automatic; Start-Service "FDResPub" | Out-Null
        netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes | Out-Null
        Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.SmbFix.Title $Script:CurrentLangConfig.UI.Sim.SmbFix.Msg
        Reset-Status
    })

# 6. Fix Icons
$window.FindName("BtnFixIcons").Add_Click({
        Set-Status "Rebuilding Icons"
        try {
            Stop-Process -ProcessName explorer -Force -ErrorAction SilentlyContinue; Start-Sleep -Seconds 1
            Remove-Item "$env:LOCALAPPDATA\IconCache.db" -Force -ErrorAction SilentlyContinue | Out-Null; Start-Process explorer
            Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.Icons.Title $Script:CurrentLangConfig.UI.Sim.Icons.Msg 
        }
        catch { Show-AppleAlert "Error" "Run as Admin." }
        Reset-Status
    })

# 7. Restart Explorer
$window.FindName("BtnRestartExplorer").Add_Click({ Stop-Process -ProcessName explorer -Force; Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.Exp.Title $Script:CurrentLangConfig.UI.Sim.Exp.Msg })

# 8. Ultimate Power
$window.FindName("BtnHighPerf").Add_Click({ powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 | Out-Null; Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.Perf.Title $Script:CurrentLangConfig.UI.Sim.Perf.Msg })

# 9. Fix Updates
$window.FindName("BtnFixUpdate").Add_Click({
        Set-Status "Stopping Services"
        Stop-Service wuauserv -Force -ErrorAction SilentlyContinue; Stop-Service bits -Force -ErrorAction SilentlyContinue
        Set-Status "Clearing Cache"
        Remove-Item "$env:SystemRoot\SoftwareDistribution" -Recurse -Force -ErrorAction SilentlyContinue | Out-Null
        Set-Status "Starting Services"
        Start-Service wuauserv | Out-Null; Start-Service bits | Out-Null
        Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.UpdateFix.Title $Script:CurrentLangConfig.UI.Sim.UpdateFix.Msg
        Reset-Status
    })

# 10. Win11 Menu
$window.FindName("BtnWin11Menu").Add_Click({
        Set-Status "Modifying Registry"
        $Reg = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"
        if (-not (Test-Path $Reg)) { New-Item -Path $Reg -Force | Out-Null }
        Set-ItemProperty -Path $Reg -Name "(Default)" -Value "" -Force | Out-Null
        Stop-Process -Name explorer -Force
        Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.MenuFix.Title $Script:CurrentLangConfig.UI.Sim.MenuFix.Msg
        Reset-Status
    })

# 11. Fix Spooler
$window.FindName("BtnFixPrintSvc").Add_Click({
        Set-Status "Restarting Spooler"
        Restart-Service Spooler -Force | Out-Null
        Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.PrintSvc.Title $Script:CurrentLangConfig.UI.Sim.PrintSvc.Msg
        Reset-Status
    })

# 12. Fix 11b & 709 (双重修复)
$window.FindName("BtnFixPrint11b").Add_Click({
        Set-Status "Applying Patch"
        try {
            # --- [11b 修复] ---
            New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Print" -Name "RpcAuthnLevelPrivacyEnabled" -Value 0 -PropertyType DWORD -Force -ErrorAction Stop | Out-Null
        
            # --- [新增：709 修复] ---
            # 允许通过 IP 或别名连接 DNS，解决主机名解析导致的 709 报错
            New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Print" -Name "DnsOnWire" -Value 1 -PropertyType DWORD -Force -ErrorAction Stop | Out-Null
        
            Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.Print11b.Title $Script:CurrentLangConfig.UI.Sim.Print11b.Msg 
        }
        catch { Show-AppleAlert "Error" "Run as Admin." }
        Reset-Status
    })

# 13. SSD TRIM (全盘自动识别版)
$window.FindName("BtnSsdTrim").Add_Click({
        Set-Status "Running TRIM"
        try {
            # 获取所有带盘符的固定磁盘卷，并逐一执行 ReTrim
            $targetVolumes = Get-Volume | Where-Object { $_.DriveLetter -ne $null -and $_.DriveType -eq 'Fixed' }
            foreach ($vol in $targetVolumes) {
                Optimize-Volume -DriveLetter $vol.DriveLetter -ReTrim | Out-Null
            }
            # 优化完成后，调用原本配置好的语言包弹窗
            Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.Trim.Title $Script:CurrentLangConfig.UI.Sim.Trim.Msg 
        }
        catch { 
            Show-AppleAlert "Error" "Failed. Ensure SSD & Admin." 
        }
        Reset-Status
    })

# 14. SMART Check
$window.FindName("BtnDiskSmart").Add_Click({
        Set-Status "Checking Disk"
        $bad = Get-PhysicalDisk | Where-Object { $_.HealthStatus -ne "Healthy" }
        if ($bad) { Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.SmartBad.Title $Script:CurrentLangConfig.UI.Sim.SmartBad.Msg }
        else { Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.SmartOK.Title $Script:CurrentLangConfig.UI.Sim.SmartOK.Msg }
        Reset-Status
    })

# 15. Sys Repair
$window.FindName("BtnSysRepair").Add_Click({
        Show-AppleAlert "Start Repair" "Starting System Repair (SFC+DISM).`r`nThis will take 10-20 mins. Please wait..."
        Set-Status "Running DISM"; Start-Process -FilePath "dism.exe" -ArgumentList "/Online /Cleanup-Image /RestoreHealth" -Wait -NoNewWindow
        Set-Status "Running SFC"; Start-Process -FilePath "sfc.exe" -ArgumentList "/scannow" -Wait -NoNewWindow
        Show-AppleAlert $Script:CurrentLangConfig.UI.Sim.SysRep.Title $Script:CurrentLangConfig.UI.Sim.SysRep.Msg
        Reset-Status
    })

# ------------------------------------------------------------------------------
# 4. 初始化与启动
# ------------------------------------------------------------------------------

# 初始化语言列表
Init-Language-System

# ==============================================================================
# [智能语言适配 - OpsKit v1.0 最终通用版]
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