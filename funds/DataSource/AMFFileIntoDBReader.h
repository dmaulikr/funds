//
//  AMFFileIntoDBReader.h
//  funds
//
//  Created by Michael on 10.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

@protocol AMFStorageHandlerProtocol;

@protocol AMFFileIntoDBReader <NSObject>

/**
 handler for data storage after it was read from file
 */
@property (nonatomic, strong) id<AMFStorageHandlerProtocol> handler;

/**
 reads contents of given file wihout its deletion
 */
-(void)populateContentsWithFile:(NSString*)file;

/**
 checks if Documents folder has files of needed type
 then reads and deletes them
 */
-(void)checkDocumentsFolderForFiles;

@end
