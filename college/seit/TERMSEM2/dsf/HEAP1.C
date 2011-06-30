main()
{
	int a[10];
	int i, j, n ;
	/* Inserting the elements into a Heap */
	printf ( "Enter the elements : " ) ;
	for ( i = 0 ; i < 10 ; i++ )
	{
		scanf ( "%d", &a[i] ) ;
		insert ( a, i + 1 ) ;
	}
	n = 10 ;
	for ( i = 0 ; i < 10 ; i++ )
		del_heap ( a, a[i], --n ) ;
	for ( i = 0 ; i < 10 ; i++ )
		printf ( " %d", a[i] ) ;
}

insert ( int *a, int pos )
{
	int par, t ;
	par = pos/2 ;
	while ( par > 0 )
	{
		if ( a[pos-1] > a[par-1] )
		{
			t = a[pos-1] ;
			a[pos-1] = a[par-1] ;
			a[par-1] = t ;
			pos = par ;
			par /= 2 ;
		}
		else
		{
			pos = par ;
			par /= 2 ;
		}
	}
}

del_heap ( int *a, int x, int pos )
{
	int par = 1, left = 2, right = 3, t ;
	/* Deletion and Insertion at the Last pos */
	t = a[0] ;
	a[0] = a[pos] ;
	a[pos] = t ;
	/* Sinking the Zeroeth Node at its right place */
	pos-- ;
	if ( pos > 1 )
	{
		if ( a[left-1] > a[par-1] )
			sink ( a, pos, par, left, right ) ;
		if ( a[right-1] > a[par-1] )
			sink ( a, pos, par, left, right ) ;
	}
}

sink ( int *a, int pos, int par, int left, int right )
{
	int t ;
	if ( a[left-1] > a[par-1] )
	{
		t = a[left-1] ;
		a[left-1] = a[par-1] ;
		a[par-1] = t ;
	}
	if ( a[right-1] > a[par-1] )
	{
		t = a[right-1] ;
		a[right-1] = a[par-1] ;
		a[par-1] = t ;
	}
	par = left ;
	left *= 2 ;
	right = left + 1 ;
	if ( left > pos || right > pos )
		return ;
	else
		sink ( a, pos, par, left, right ) ;
}

