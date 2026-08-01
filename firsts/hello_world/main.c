typedef unsigned long long int size_t;
typedef long long int ssize_t;

/*Retorna tamanho da string... */
size_t str_len(char *s);

/*Imprime uma string na saida padrão... */
ssize_t str_print(const char *s, size_t len);

int main(void) {
    char *str = "Hello world!\n";
    size_t count = str_print(str, str_len(str));
    return (int)count;
}
