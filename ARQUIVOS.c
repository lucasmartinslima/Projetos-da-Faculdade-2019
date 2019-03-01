#include <stdio.h>

typedef struct{
	
	char nome[40];
	int senha;
	char email[90];
	
}perfil;



int main(){
	
	perfil P[40];
	char name_file[35]= {"teste.txt"};
	int i;
	FILE *p;
	
	p = fopen(name_file, "wt");
	
	//JOGA NA MEMORIA
	for(i=0;i<2;i++){
		
		printf("nome: ");
		scanf("%s", &P[i].nome);
		
		printf("email: ");
		scanf("%s", &P[i].email);
		 
		printf("senha: ");
		scanf("%i", &P[i].senha);	
	}

    //PEGA DA MEMORIA E JOGA NO HD
	for(i=0;i<2;i++){
		fprintf(p,"%s \n", &P[i].nome);
		fprintf(p,"%s \n", &P[i].email);
		fprintf(p,"%i \n", &P[i].senha);	
	}

	fclose(p);
	
	p= fopen(name_file, "rt");
	
	for(i=0;i<2;i++){
		fscanf(p,  "%s \n",  &P[i].nome);
		fscanf(p,  "%s \n",  &P[i].email);
		fscanf(p,  "%i \n",  &P[i].senha);	
		
		printf("\n nome: %s", P[i].nome);
		printf("\n email: %s", P[i].email);
		printf("\n senha: %i", P[i].senha);
		printf("\n\n");
	}

	fclose(p);
	
	return 0;
}
