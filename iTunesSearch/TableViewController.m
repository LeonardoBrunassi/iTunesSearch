//
//  ViewController.m
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "iTunesManager.h"
#import "Filme.h"
#import "Ebook.h"
#import "Musica.h"
#import "Podcast.h"
#import "Detalhes.h"

@interface TableViewController () {
    NSArray *midias;
}

@end

@implementation TableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableview setDelegate:self];
    [self.tableview setDataSource:self];
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:@"celulaPadrao"];
    
    iTunesManager *itunes = [iTunesManager sharedInstance];
   // midias = [itunes buscarMidias:@"potato"];
    
//#warning Necessario para que a table view tenha um espaco em relacao ao topo, pois caso contrario o texto ficara atras da barra superior
//    self.tableview.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableview.bounds.size.width, 15.f)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Metodos do UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //return [midias count];
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[midias objectAtIndex:section] count];
    
}

-(NSString *) tableView:(UITableView *) tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"filmes";
            break;
        case 1:
            return @"ebooks";
            break;
        case 2:
            return @"musicas";
            break;
        case 3:
            return @"podcasts";
            break;
            
        default:
            return nil;
            break;
            
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *celula = [self.tableview dequeueReusableCellWithIdentifier:@"celulaPadrao"];
    
    //mid = [[NSArray alloc] initWithArray:[midias objectAtIndex:indexPath.section]];
    

    Filme *filme = [[Filme alloc] init];
    Ebook *ebook= [[Ebook alloc] init];;
    Musica *musica= [[Musica alloc] init];;
    Podcast *podcast= [[Podcast alloc] init];;
    
    //long row = [indexPath row];
    
    switch (indexPath.section) {
        case 0:
            filme = [[midias objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
            //filme = [mid objectAtIndex:row];
            [celula.nome setText:filme.nome];
            [celula.tipo setText:@"Filme"];
            [celula.genero setText:filme.genero];
            [celula.preco setText:[NSString stringWithFormat:@"Preço: %@", filme.preco]];
            return celula;
            break;
        case 1:
            ebook = [[midias objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
            //ebook = [mid objectAtIndex:row];
            [celula.nome setText:ebook.nome];
            [celula.tipo setText:@"Ebook"];
            [celula.genero setText:ebook.genero];
            [celula.preco setText:[NSString stringWithFormat:@"Preço: %@", ebook.preco]];
            return celula;
            break;
        case 2:
            musica = [[midias objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
            //musica = [mid objectAtIndex:row];
            [celula.nome setText:musica.nome];
            [celula.tipo setText:@"Musica"];
            [celula.genero setText:musica.genero];
            [celula.preco setText:[NSString stringWithFormat:@"Preço: %@", musica.preco]];
            return celula;
            break;
        case 3:
            podcast = [[midias objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
            //podcast = [mid objectAtIndex:row];
            [celula.nome setText:podcast.nome];
            [celula.tipo setText:@"Podcast"];
            [celula.genero setText:podcast.genero];
            [celula.preco setText:[NSString stringWithFormat:@"Preço: %@", podcast.preco]];
            return celula;
            break;
            
            default:
            break;
    }
    
    return nil;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

-(void) tableView: (UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Detalhes *det = [[Detalhes alloc] init];
    det.row = [indexPath row];
    det.section = [indexPath section];
    [[self navigationController] pushViewController:det animated:YES];
    
}


- (IBAction)searchButton:(id)sender {
    iTunesManager *itunes = [iTunesManager sharedInstance];
    NSString *espaco = [_label.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    midias = [itunes buscarMidias: espaco];
    [self.tableview reloadData];
    
}
@end
