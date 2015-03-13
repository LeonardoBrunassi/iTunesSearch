//
//  Detalhes.h
//  iTunesSearch
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 13/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Detalhes : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *tipo;
@property (weak, nonatomic) IBOutlet UIImageView *imagem;
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *nomeN;
@property (weak, nonatomic) IBOutlet UILabel *preço;
@property (weak, nonatomic) IBOutlet UILabel *preçoP;
@property (weak, nonatomic) IBOutlet UILabel *genero;
@property (weak, nonatomic) IBOutlet UILabel *generoG;
@property int row;
@property int section;



@end
