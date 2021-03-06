//
//  iTunesManager.m
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "iTunesManager.h"
#import "Filme.h"
#import "Musica.h"
#import "Podcast.h"
#import "Ebook.h"


@implementation iTunesManager



static iTunesManager *SINGLETON = nil;

static bool isFirstAccess = YES;

#pragma mark - Public Method

@synthesize total;

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];    
    });
    
    return SINGLETON;
}


- (NSArray *)buscarMidias:(NSString *)termo {
    if (!termo) {
        termo = @"";
    }
    
    NSString *url = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&media=all", termo];
    NSData *jsonData = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
    
    NSError *error;
    NSDictionary *resultado = [NSJSONSerialization JSONObjectWithData:jsonData
                                                              options:NSJSONReadingMutableContainers
                                                                error:&error];
    if (error) {
        NSLog(@"Não foi possível fazer a busca. ERRO: %@", error);
        return nil;
    }
    
    NSArray *resultados = [resultado objectForKey:@"results"];
    NSMutableArray *filmes = [[NSMutableArray alloc] init];
    NSMutableArray *musicas = [[NSMutableArray alloc] init];
    NSMutableArray *podcasts = [[NSMutableArray alloc] init];
    NSMutableArray *ebooks = [[NSMutableArray alloc] init];
    
    
    for (NSDictionary *item in resultados) {
        
        if ([[item objectForKey:@"kind"] isEqualToString:@"feature-movie"]) {
            Filme *filme = [[Filme alloc] init];
            [filme setNome:[item objectForKey:@"trackName"]];
            [filme setTrackId:[item objectForKey:@"trackId"]];
            [filme setArtista:[item objectForKey:@"artistName"]];
            [filme setDuracao:[item objectForKey:@"trackTimeMillis"]];
            [filme setGenero:[item objectForKey:@"primaryGenreName"]];
            [filme setPais:[item objectForKey:@"country"]];
            [filme setPreco:[item objectForKey:@"trackPrice"]];
            [filmes addObject:filme];
        }
        
        if ([[item objectForKey:@"kind"] isEqualToString:@"song"]) {
            Musica *musica = [[Musica alloc] init];
            [musica setNome:[item objectForKey:@"trackName"]];
            [musica setTrackId:[item objectForKey:@"trackId"]];
            [musica setArtista:[item objectForKey:@"artistName"]];
            [musica setDuracao:[item objectForKey:@"trackTimeMillis"]];
            [musica setGenero:[item objectForKey:@"primaryGenreName"]];
            [musica setPais:[item objectForKey:@"country"]];
            [musica setPreco:[item objectForKey:@"trackPrice"]];
            [musicas addObject:musica];
        }
        
        if ([[item objectForKey:@"kind"] isEqualToString:@"podcast"]) {
            Podcast *podcast = [[Podcast alloc] init];
            [podcast setNome:[item objectForKey:@"trackName"]];
            [podcast setTrackId:[item objectForKey:@"trackId"]];
            [podcast setArtista:[item objectForKey:@"artistName"]];
            [podcast setDuracao:[item objectForKey:@"trackTimeMillis"]];
            [podcast setGenero:[item objectForKey:@"primaryGenreName"]];
            [podcast setPais:[item objectForKey:@"country"]];
            [podcast setPreco:[item objectForKey:@"trackPrice"]];
            [podcasts addObject:podcast];
        }
        
        
        if ([[item objectForKey:@"kind"] isEqualToString:@"ebook"]) {
            Ebook *ebook = [[Ebook alloc] init];
            [ebook setNome:[item objectForKey:@"trackName"]];
            [ebook setTrackId:[item objectForKey:@"trackId"]];
            [ebook setAutor:[item objectForKey:@"artistName"]];
            [ebook setPaginas:[item objectForKey:@"trackTimeMillis"]];
            [ebook setGenero:[item objectForKey:@"primaryGenreName"]];
            [ebook setPais:[item objectForKey:@"country"]];
            [ebook setPreco:[item objectForKey:@"trackPrice"]];
            [ebooks addObject:ebook];
        }
        
        
    }
    
    total = [[NSArray alloc] initWithObjects:filmes,musicas,podcasts,ebooks, nil];
    return total;
}




#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return [[iTunesManager alloc] init];
}

- (id)mutableCopy
{
    return [[iTunesManager alloc] init];
}

- (id) init
{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    return self;
}


@end
