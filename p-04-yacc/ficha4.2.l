%{
#include "structures.h"
#include "symbol_table.h"
#include "y.tab.h"

table_element *symtab=NULL;

extern is_program* myprogram;
%}

ID       [a-z][a-z0-9]*

%%
integer     {return INTEGER;}
double      {return DOUBLE;}
char        {return CHARACTER;}
let         {return LET;}
in          {return IN;}
end         {return END;}
write       {return WRITE;    }
{ID}        {yylval.id = strdup(yytext); return IDENTIFIER;}
[ \t\n]+    /* ignorar espacos em branco e mudancas de linha*/
.           {return yytext[0];}
%%

int main(int argc, char **argv) {
    int errors;

    yyparse();
    return 0;
}



int yywrap(void){
    return 1;
}
/**************************
*****************************/
