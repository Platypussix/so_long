#include "../so_long.h"

int main(int ac, char **av)
{
	void *mlx_ptr;
	void *win_ptr;

	(void) ac;
	mlx_ptr = mlx_init();
	win_ptr = mlx_new_window(mlx_ptr, 1000, 1000, av[1]);
	while (1)
		;
	mlx_destroy_window(mlx_ptr, win_ptr);
	mlx_destroy_display(mlx_ptr);
	free(mlx_ptr);

}
