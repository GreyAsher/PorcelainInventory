   M S B A M L   `   `   `  ����P  LPorcelainInventoryApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:PorcelainInventoryApp.ViewsPorcelainInventoryApp.Views  5      S.clr-namespace:PorcelainInventoryApp.ViewModels PorcelainInventoryApp.ViewModels  5      ;    5PorcelainInventoryApp.Views.CategoryManagementControl   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   5      <d2http://schemas.microsoft.com/expression/blend/2008   5      7local)clr-namespace:PorcelainInventoryApp.Views   5      9vm.clr-namespace:PorcelainInventoryApp.ViewModels   5      .��5      � $��20q�6     � RowDefinitions  5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� $��0��6      pagingButton#��[  6   $
��Left=�5   	   $	��Top=�6$   $��0,0,0,10q�6<   .��5      ��  �� Orientation$ 
Horizontal=�6   .+�5      .  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$ 	ArrowLeft=�6(   $��16��69   $��16��6D   $��0 1 8 0q�6P   �� 5      $
��Back��6   $��80��6(   5      5      �� 5    
   $��1��6   $��Category Management��6!   $��28(�6<   $��SemiBold"�6J   
���   �$��	0 10 0 20q�6s   � 5#   
   $��2��6   $��	0 10 0 10q�6    � ColumnDefinitions 5$      �� 5%      $
��Auto �6#   �� 5&      $��* �6#   .+�5*      �� -   5        $��0��5*        addCategoryButton#��[ 6%   $��0 0 10 0q�6P   .��5+      �� $ 
Horizontal=�6   .+�5,        $
 Plus=�6,   $��11��68   $��11��6C   $��0 1 8 0q�6O   �� 5-      $��Add New Category��6    5.      5/      � 52      $��1��6   $	��250��6#   $��Right=�6/   .+�53      �� -   5         ��Name$ 	txtSearch��53        textboxSearch#��[ 6-   54      55      &   System.Windows.Controls.DataGrid  58   
   -   5          Name$ dgCategories��58      $��3��6)      AutoGenerateColumns$ False��66      HeadersVisibility$ Column=�59         CanUserAddRows$ False��6.   	   
IsReadOnly$
	 True��6E   $��11(�5:      
�������$��1q�64   
�������$��0 0 0 10q�6[   ��5;      �� *
Categories+
 �� UpdateSourceTrigger$
 PropertyChanged=�   Columns 5=      0  *System.Windows.Controls.DataGridTextColumn  5>      ,  &System.Windows.Controls.DataGridColumn   Header$ Category Name��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6]   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6<   �� *CategoryName+6]   4  .System.Windows.Controls.DataGridTemplateColumn  5@      $ Actions��6)   $ * 6:      CellTemplate 5A      �� 5B      .R�5C      �� $ 
Horizontal=�6)   .+�5D   "   �� -   5        $
��Edit��5D   )     
editButton#��[ 68   $��2q�6\   6g   �� 5E   "   -   5        $��Delete��5E   )     deleteButton#��[ 6:   $��2q�6`   6k   5F      5G      5I      5K      5L      5M      