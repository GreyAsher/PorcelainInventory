   M S B A M L   `   `   `  ����[  WLiveChartsCore.SkiaSharpView.WPF, Version=2.0.0.0, Culture=neutral, PublicKeyToken=null}Xclr-namespace:LiveChartsCore.SkiaSharpView.WPF;assembly=LiveChartsCore.SkiaSharpView.WPF LiveChartsCore.SkiaSharpView.WPF  5       PorcelainInventoryApp2   ,PorcelainInventoryApp.Views.DashboardControl   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   5      Fmc;http://schemas.openxmlformats.org/markup-compatibility/2006   5      <d2http://schemas.microsoft.com/expression/blend/2008   5      dlvcXclr-namespace:LiveChartsCore.SkiaSharpView.WPF;assembly=LiveChartsCore.SkiaSharpView.WPF   5      .��5      � $��20q�6     � RowDefinitions  5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   .+�5   
   �� $��Dashboard Overview��6   $��32(�6.   $��SemiBold"�6<   $
��Left=�5      
���   �$��0 0 0 20q�6B   � 5   
   $��1��6   $��	0 10 0 20q�6    � ColumnDefinitions 5      �� 5      $��* �6#   �� 5      $��* �6#   �� 5      $��* �6#   �� 5      $��* �6#   .+�5       �� ���#3498db �� Padding$ 20q�6*    �� CornerRadius$ 10��67   $��0��6I   $��5q�6Y   ._�5!      �� .+�5"      .  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$ CurrencyUsd=�6,   $��30��6?   $��30��6J   
�������6V   �� 5#      $��Total Sales��6    
�������$��14(�6F   �� 5$      
�������$��22(�6g   $
��Bold"�6u   ��6    �� *
TotalSales+ �� StringFormat$ 	₱{0:N2}��6u   5%      5&      �� 5)      ���#2ecc71$ 20q�6*   $ 10��67   $��1��6I   $��5q�6Y   ._�5*      �� .+�5+        $ PackageVariant=�6,   $��30��6B   $��30��6M   
�������6Y   �� 5,      $��Total Products��6    
�������$��14(�6I   �� 5-      
�������$��22(�6R   $
��Bold"�6`   ��6    �� *TotalProducts+6`   5.      5/      �� 52      ���#e74c3c$ 20q�6*   $ 10��67   $��2��6I   $��5q�6Y   ._�53      �� .+�54        $ AlertCircle=�6,   $��30��6?   $��30��6J   
�������6V   �� 55      $��Out of Stock��6    
�������$��14(�6G   �� 56      
�������$��22(�6O   $
��Bold"�6]   ��6    �� *
OutOfStock+6]   57      58      �� 5;      ���#f39c12$ 20q�6*   $ 10��67   $��3��6I   $��5q�6Y   ._�5<      �� .+�5=        $ TruckDelivery=�6,   $��30��6A   $��30��6L   
�������6X   �� 5>      $��	Suppliers��6    
�������$��14(�6D   �� 5?      
�������$��22(�6N   $
��Bold"�6\   ��6    �� *	Suppliers+6\   5@      5A      5B      � 5E   
   $��2��6    5F      �� 5G      $��2* �6#   �� 5H      $��1* �6#   .+�5L      �� 
�������
�������$��1q�6;   $ 10��6O   $��0��6a   $��5q�6q   $ 10q�6|   ._�5M      �   5N      �� 5O      $
��Auto �6(   �� 5P      $��* �6(   .+�5R      �� $!��Sales Trend (Last 6 Months)��6    $��18(�6C   $��SemiBold"�6Q   $��5q�5S      5   /LiveChartsCore.SkiaSharpView.WPF.CartesianChart  5T      $��1��6)   $��10q�66   $��Segoe UI)�6B      Series 5U      �� *SalesTrendSeries+   XAxes 5V      �� *SalesTrendXAxes+   YAxes 5W      �� *SalesTrendYAxes+5X      5Y      �� 5`      
�������
�������$��1q�6;   $ 10��6O   $��6,5,6,5q�6a   $ 10q�6r   $��1��6   ._�5a      �� .+�5b      �� $��Best Selling Products��6    $��18(�6=   $��SemiBold"�6K   $��5q�6a   �� 5c      $��12(�6J   $��0q�6X   ��6   �� *BestSellingProducts+6X   5d      5e      5i      5j      5k      