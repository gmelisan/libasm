/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gmelisan <gmelisan@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/07/20 11:44:47 by gmelisan          #+#    #+#             */
/*   Updated: 2021/07/20 16:42:39 by gmelisan         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

extern size_t ft_strlen(const char *s);
extern char   *ft_strcpy(char *dst, const char *src);
extern int   ft_strcmp(const char *s1, const char *s2);
extern ssize_t ft_write(int fildes, const void *buf, size_t nbyte);
extern ssize_t ft_read(int fildes, void *buf, size_t nbyte);
extern char	  *ft_strdup(const char *s);

void    test_ft_strlen()
{
	printf("Test ft_strlen()\n");
	
    size_t a, b;
    char t1[] = "Test string";
	a = strlen(t1);
	b = ft_strlen(t1);
    printf(" 1 (%zu, %zu) ", a, b);
	assert(a == b);
	printf("ok\n");
	
    char t2[] = "";
	a = strlen(t2);
	b = ft_strlen(t2);
	printf(" 2 (%zu, %zu) ", a, b);
    assert(a == b);
	printf("ok\n");
	
    int t3_size = 100000000;
    char *t3 = malloc(t3_size);
    for (int i = 0; i < t3_size; ++i)
        t3[i] = 'a';
    t3[t3_size] = 0;
	a = strlen(t3);
	b = ft_strlen(t3);
	printf(" 3 (%zu, %zu) ", a, b);
    assert(a == b);
	printf("ok\n");
    
    free(t3);
}

void	test_ft_strcpy()
{
	printf("Test ft_strcpy()\n");

	char t1_src[] = "Test-str_testStr";
	char t1_dst[100];
	char t1_dst_ft[100];
	char *t1_res = strcpy(t1_dst, t1_src);
	char *t1_res_ft = ft_strcpy(t1_dst_ft, t1_src);
	printf(" 1 (%s, %s) ", t1_dst, t1_dst_ft);
	assert(strcmp(t1_dst, t1_dst_ft) == 0);
	printf("ok\n");
	
	printf("   (%p, %p) ", t1_dst_ft, t1_res_ft);
	assert(t1_dst_ft == t1_res_ft);
	printf("ok\n");
	

	char t2_src[] = "";
	char t2_dst[100];
	char t2_dst_ft[100];
	char *t2_res = strcpy(t2_dst, t2_src);
	char *t2_res_ft = ft_strcpy(t2_dst_ft, t2_src);
	printf(" 2 (%s, %s) ", t2_dst, t2_dst_ft);
	assert(strcmp(t2_dst, t2_dst_ft) == 0);
	printf("ok\n");
	
	printf("   (%p, %p) ", t2_dst_ft, t2_res_ft);
	assert(t2_dst_ft == t2_res_ft);
	printf("ok\n");
}

void	test_ft_strcmp()
{
	printf("Test ft_strcmp()\n");

	int res, res_ft;
	
	char t1_a[] = "TestTest";
	char t1_b[] = "TestTest";
	res = strcmp(t1_a, t1_b);
	res_ft = ft_strcmp(t1_a, t1_b);
	printf(" 1 (%d, %d) ", res, res_ft);
	assert(res == res_ft);
	printf("ok\n");

	char t2_a[] = "TestA";
	char t2_b[] = "TestB";
	res = strcmp(t2_a, t2_b);
	res_ft = ft_strcmp(t2_a, t2_b);
	printf(" 2 (%d, %d) ", res, res_ft);
	assert(res == res_ft);
	printf("ok\n");

	char t3_a[] = "TestB";
	char t3_b[] = "TestA";
	res = strcmp(t3_a, t3_b);
	res_ft = ft_strcmp(t3_a, t3_b);
	printf(" 3 (%d, %d) ", res, res_ft);
	assert(res == res_ft);
	printf("ok\n");

	char t4_a[] = "";
	char t4_b[] = "";
	res = strcmp(t4_a, t4_b);
	res_ft = ft_strcmp(t4_a, t4_b);
	printf(" 4 (%d, %d) ", res, res_ft);
	assert(res == res_ft);
	printf("ok\n");

	char t5_a[] = "";
	char t5_b[] = "TestB";
	res = strcmp(t5_a, t5_b);
	res_ft = ft_strcmp(t5_a, t5_b);
	printf(" 5 (%d, %d) ", res, res_ft);
	assert(res == res_ft);
	printf("ok\n");

	char t6_a[] = "TestA";
	char t6_b[] = "";
	res = strcmp(t6_a, t6_b);
	res_ft = ft_strcmp(t6_a, t6_b);
	printf(" 6 (%d, %d) ", res, res_ft);
	assert(res == res_ft);
	printf("ok\n");

	char t7_a[] = "Test";
	char t7_b[] = "TestTESTTEST";
	res = strcmp(t7_a, t7_b);
	res_ft = ft_strcmp(t7_a, t7_b);
	printf(" 7 (%d, %d) ", res, res_ft);
	assert(res == res_ft);
	printf("ok\n");

	char t8_a[] = "TestTESTTEST";
	char t8_b[] = "Test";
	res = strcmp(t8_a, t8_b);
	res_ft = ft_strcmp(t8_a, t8_b);
	printf(" 8 (%d, %d) ", res, res_ft);
	assert(res == res_ft);
	printf("ok\n");
	
}

void	test_ft_write()
{
	printf("Test ft_write() MANUAL\n");

	printf(" 1 write('Hello\\n'):\n");
	char t1[] = "Hello\n";
	write(1, &t1, 6);
	printf(" 1 ft_write('Hello\\n'):\n");
	ft_write(1, &t1, 6);


	ssize_t ret = write(-1, &t1, 6);
	int e = errno;
	errno = 0;
	ssize_t ret_ft = ft_write(-1, &t1, 6);
	int e_ft = errno;
	printf(" 2 (%d, %d) ", e, e_ft);
	assert(e == e_ft);
	printf("ok\n");
	printf(" 2 (%zd, %zd) ", ret, ret_ft);
	assert(ret == ret_ft);
	printf("ok\n");
}

void	test_ft_read()
{
	printf("Test ft_read() MANUAL\n");
	char buf[101] = {0};

	printf(" 1 Please type some text and press ENTER:\n");
	ssize_t res = ft_read(0, buf, 100);
	printf(" 1 you entered '%s' (size %zd)\n", buf, res);
}

void	test_ft_strdup()
{
	printf("Test ft_strdup()\n");

	char t1[] = "Test string duplication";
	char *ptr = strdup(t1);
	char *ptr_ft = ft_strdup(t1);
	printf("1 (%s, %s) ", ptr, ptr_ft);
	assert(strcmp(ptr, ptr_ft) == 0);
	printf("ok\n");
	free(ptr);
	free(ptr_ft);
}

int     main()
{
    test_ft_strlen();
	test_ft_strcpy();
	test_ft_strcmp();
	test_ft_write();
	test_ft_read();
	test_ft_strdup();
    return (0);
}
