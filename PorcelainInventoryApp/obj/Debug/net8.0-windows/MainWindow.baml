   M S B A M L   `   `   `  ����  PorcelainInventoryApp&     PorcelainInventoryApp.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   5   	   <d2http://schemas.microsoft.com/expression/blend/2008   5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	     � Title$  Porcelain Inventory��5   	    � WindowState$ 	Maximized=�5	   	    � 	Resources 5         	BoolToVis��%   &	        �� 5   
   6'   5      .��5      �� 
������� �� CornerRadius$ 20��6    ._�5   
   �  � ColumnDefinitions 5      �� 5      $	��200 �6#   �� 5      $��* �6#   .+�5      �� 
�������$ 0 50 0 0��6'   $��0 50 0 0q�6?   ._�5      ]� $
��True��6   .+�5      �� $��Admin��6    
�������$��22(�6@   $��SemiBold"�6N   $	��Top=�5        �� TextAlignment$ Center=�65   $��	5 25 0 10q�6L   �� 5      $��Cor Jeff Porcelaine��6    
�������$��14(�6N   $��SemiBold"�6\   $	��Top=�5        $ Center=�65   �� 5!      $��30q�6    $	��Top=�6,   $��1��6A   
�������6L   �� 5$      $��Hidden=�6#   $	��Top=�6H   .��5%      �� .+�5'      �� -   5          
menuButton#��[ 5'   %   .��5(   "   ��  �� Orientation$ 
Horizontal=�6-   .+�5)   &   .  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$ MonitorDashboard=�6<     menuBUttonIcon#��[ 6T   �� 5*   &   $��	Dashboard��60   5+   #   5,      �� 5.      -   5        #��[ 5.   %   .��5/   "   �� $ 
Horizontal=�6-   .+�50   &     $
 Cube=�6<   #��[ 6H   �� 51   &   $��Products��60   52   #   53      �� 55      -   5        #��[ 55   %   .��56   "   �� $ 
Horizontal=�6-   .+�57   &     $ 	Warehouse=�6<   #��[ 6M   �� 58   &   $��Stock Management��60   59   #   5:      �� 5<      -   5        #��[ 5<   %   .��5=   "   �� $ 
Horizontal=�6-   .+�5>   &     $ TruckDelivery=�6<   #��[ 6Q   �� 5?   &   $��	Suppliers��60   5@   #   5A      �� 5C      -   5        #��[ 5C   %   .��5D   "   �� $ 
Horizontal=�6-   .+�5E   &     $ AccountAlertOutline=�6<   #��[ 6W   �� 5F   &   $��Customer��60   5G   #   5H      �� 5J      -   5        #��[ 5J   %   .��5K   "   �� $ 
Horizontal=�6-   .+�5L   &     $
 Cart=�6<   #��[ 6H   �� 5M   &   $��Sales��60   5N   #   5O      �� 5Q      -   5        #��[ 5Q   %   .��5R   "   �� $ 
Horizontal=�6-   .+�5S   &     $ 	Warehouse=�6<   #��[ 6M   �� 5T   &   $��Report��60   5U   #   5V      �� 5X      -   5        #��[ 5X   %   .��5Y   "   �� $ 
Horizontal=�6-   .+�5Z   &     $ Account=�6<   #��[ 6K   �� 5[   &   $��Users and Roles��60   5\   #   5]      �� 5_      #��[ 6%   .��5`   "   �� $ 
Horizontal=�6-   .+�5a   &     $	 Cog=�6<   #��[ 6G   �� 5b   &   $��Settings��60   5c   #   5d      �� 5f      #��[ 6%   .��5g   "   �� $ 
Horizontal=�6-   .+�5h   &     $ Logout=�6<   #��[ 6J   �� 5i   &   $��Logout��60   5j   #   5k      5m      5n      5o      5p      � 5s      $��1��6   $��20q�6#   .+�5t      �� -	   5         ��Name$ MainContent��5t   !   $��MainContent��66   5u      5w      5x      5y      