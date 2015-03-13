//
//  Detalhes.m
//  iTunesSearch
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 13/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "Detalhes.h"
#import "iTunesManager.h"
#import "Filme.h"
#import "Musica.h"
#import "Podcast.h"
#import "Ebook.h"

@interface Detalhes ()

@end

@implementation Detalhes

@synthesize row,section;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated {
    iTunesManager *itm = [iTunesManager sharedInstance];
    id objeto = [[itm.total objectAtIndex:section] objectAtIndex:row];
    
    Filme *filme;
    Ebook *ebook;
    Musica *musica;
    Podcast *podcast;
    
    //long row = [indexPath row];
    
    switch (section) {
        case 0:
            filme = objeto;
            //filme = [mid objectAtIndex:row];
            [_nomeN setText:filme.nome];
            //[celula.tipo setText:@"Filme"];
            [_generoG setText:filme.genero];
            [_preçoP setText:[NSString stringWithFormat:@"Preço: %@", filme.preco]];
            break;
        case 1:
            ebook = objeto;
            //ebook = [mid objectAtIndex:row];
            [_nomeN setText:ebook.nome];
            //[celula.tipo setText:@"Ebook"];
            [_generoG setText:ebook.genero];
            [_preçoP setText:[NSString stringWithFormat:@"Preço: %@", ebook.preco]];
            break;
        case 2:
            musica = objeto;
            //musica = [mid objectAtIndex:row];
            [_nomeN setText:musica.nome];
            //[celula.tipo setText:@"Musica"];
            [_generoG setText:musica.genero];
            [_preçoP setText:[NSString stringWithFormat:@"Preço: %@", musica.preco]];
            break;
        case 3:
            podcast = objeto;
            //podcast = [mid objectAtIndex:row];
            [_nomeN setText:podcast.nome];
            //[celula.tipo setText:@"Podcast"];
            [_generoG setText:podcast.genero];
            [_preçoP setText:[NSString stringWithFormat:@"Preço: %@", podcast.preco]];
            break;
            
        default:
            break;
    }

    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
