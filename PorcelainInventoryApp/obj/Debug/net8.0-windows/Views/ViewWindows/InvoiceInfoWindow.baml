   M S B A M L   `   `   `  ����  PorcelainInventoryApp?    9PorcelainInventoryApp.Views.ViewWindows.InvoiceInfoWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   5   	     � Title$  Invoice Receipt��5   	    � WindowStartupLocation$ CenterScreen=�5   	   $	��500��5   	   $	��600��6   
�������
�������$��1q�5
   	    � 
ResizeMode$ NoResize=�5   	   .��5      � $��20q�6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   ]� $��0��6   $��0,0,-250,10q�6!   .+�5      �� $��Invoice Receipt��6   $��24(�6/   $��SemiBold"�6=   
���   �$
��Left=�6f   �� 5      -   5        $��30��5      $��30��6    $��Right=�6,   
������ $��0q�5   .    � ToolTip$ Print��5      .��5      .  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$ Printer=�6(   $��20��67   $��20��6B   
���   �6N   5      5      �� 5!   
   $��1��6    �� Orientation$ Vertical=�6"   $��0,0,0,10q�69   .+�5"      �� $��Customer Name: ��6   $
��Bold"�6/   �� 5#      -   5         ��Name$ txtCustomerName��5#      $��0,0,0,5q�61   �� 5$      $��Date Purchased: ��6   $
��Bold"�60   �� 5%      -   5        $ txtDatePurchased��5%      5&      &   System.Windows.Controls.DataGrid  5)   
   -   5          Name$ dgInvoiceProducts��5)      $��2��5*      	   AutoGenerateColumns$	 False��5+      
   HeadersVisibility$
 Column=�5,         
IsReadOnly$
 True��5-         CanUserResizeColumns$ False��5.         CanUserReorderColumns$ False��5/         CanUserAddRows$ False��50      $��	0,10,0,10q�51      $��0q�52         Columns 53      0  *System.Windows.Controls.DataGridTextColumn  54      ,  &System.Windows.Controls.DataGridColumn   Header$ Product Name��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6[   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6;   �� *ProductName+6[     55      $ Quantity��6%   $ 80 6T    67   �� *
Quantity+6T     56      $ Price��6%   $	 100 6f    64   �� *Price+ �� StringFormat$ 	₱{0:N2}��6f   58      �� 5;   
   $��3��6   $ 
Horizontal=�6"   $��Right=�6;   $��0,10,0,0q�6W   .+�5<      �� $��Total Amount:��6   $��16(�6-   $
��Bold"�6;   $��Center=�6M   �� 5=      -   5        $ txtTotalAmount��5=      $
��0.00��60   $��16(�6<   $
��Bold"�6J   
��� � �$��10,0,0,0q�6o   5>      5?      5@      