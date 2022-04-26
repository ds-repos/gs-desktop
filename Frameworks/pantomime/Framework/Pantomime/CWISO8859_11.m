/*
**  CWISO8859_11.m
**
**  Copyright (c) 2001-2004 Ludovic Marcotte
**
**  Author: Ludovic Marcotte <ludovic@Sophos.ca>
**
**  This library is free software; you can redistribute it and/or
**  modify it under the terms of the GNU Lesser General Public
**  License as published by the Free Software Foundation; either
**  version 2.1 of the License, or (at your option) any later version.
**  
**  This library is distributed in the hope that it will be useful,
**  but WITHOUT ANY WARRANTY; without even the implied warranty of
**  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
**  Lesser General Public License for more details.
**  
** You should have received a copy of the GNU General Public License
** along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <Pantomime/CWISO8859_11.h>

static struct charset_code code_table[]={
{0x20,0x0020}, {0x21,0x0021}, {0x22,0x0022}, {0x23,0x0023}, {0x24,0x0024}, 
{0x25,0x0025}, {0x26,0x0026}, {0x27,0x0027}, {0x28,0x0028}, {0x29,0x0029}, 
{0x2a,0x002a}, {0x2b,0x002b}, {0x2c,0x002c}, {0x2d,0x002d}, {0x2e,0x002e}, 
{0x2f,0x002f}, {0x30,0x0030}, {0x31,0x0031}, {0x32,0x0032}, {0x33,0x0033}, 
{0x34,0x0034}, {0x35,0x0035}, {0x36,0x0036}, {0x37,0x0037}, {0x38,0x0038}, 
{0x39,0x0039}, {0x3a,0x003a}, {0x3b,0x003b}, {0x3c,0x003c}, {0x3d,0x003d}, 
{0x3e,0x003e}, {0x3f,0x003f}, {0x40,0x0040}, {0x41,0x0041}, {0x42,0x0042}, 
{0x43,0x0043}, {0x44,0x0044}, {0x45,0x0045}, {0x46,0x0046}, {0x47,0x0047}, 
{0x48,0x0048}, {0x49,0x0049}, {0x4a,0x004a}, {0x4b,0x004b}, {0x4c,0x004c}, 
{0x4d,0x004d}, {0x4e,0x004e}, {0x4f,0x004f}, {0x50,0x0050}, {0x51,0x0051}, 
{0x52,0x0052}, {0x53,0x0053}, {0x54,0x0054}, {0x55,0x0055}, {0x56,0x0056}, 
{0x57,0x0057}, {0x58,0x0058}, {0x59,0x0059}, {0x5a,0x005a}, {0x5b,0x005b}, 
{0x5c,0x005c}, {0x5d,0x005d}, {0x5e,0x005e}, {0x5f,0x005f}, {0x60,0x0060}, 
{0x61,0x0061}, {0x62,0x0062}, {0x63,0x0063}, {0x64,0x0064}, {0x65,0x0065}, 
{0x66,0x0066}, {0x67,0x0067}, {0x68,0x0068}, {0x69,0x0069}, {0x6a,0x006a}, 
{0x6b,0x006b}, {0x6c,0x006c}, {0x6d,0x006d}, {0x6e,0x006e}, {0x6f,0x006f}, 
{0x70,0x0070}, {0x71,0x0071}, {0x72,0x0072}, {0x73,0x0073}, {0x74,0x0074}, 
{0x75,0x0075}, {0x76,0x0076}, {0x77,0x0077}, {0x78,0x0078}, {0x79,0x0079}, 
{0x7a,0x007a}, {0x7b,0x007b}, {0x7c,0x007c}, {0x7d,0x007d}, {0x7e,0x007e}, 
{0xa1,0x0e01}, {0xa2,0x0e02}, {0xa3,0x0e03}, {0xa4,0x0e04}, {0xa5,0x0e05}, 
{0xa6,0x0e06}, {0xa7,0x0e07}, {0xa8,0x0e08}, {0xa9,0x0e09}, {0xaa,0x0e0a}, 
{0xab,0x0e0b}, {0xac,0x0e0c}, {0xad,0x0e0d}, {0xae,0x0e0e}, {0xaf,0x0e0f}, 
{0xb0,0x0e10}, {0xb1,0x0e11}, {0xb2,0x0e12}, {0xb3,0x0e13}, {0xb4,0x0e14}, 
{0xb5,0x0e15}, {0xb6,0x0e16}, {0xb7,0x0e17}, {0xb8,0x0e18}, {0xb9,0x0e19}, 
{0xba,0x0e1a}, {0xbb,0x0e1b}, {0xbc,0x0e1c}, {0xbd,0x0e1d}, {0xbe,0x0e1e}, 
{0xbf,0x0e1f}, {0xc0,0x0e20}, {0xc1,0x0e21}, {0xc2,0x0e22}, {0xc3,0x0e23}, 
{0xc4,0x0e24}, {0xc5,0x0e25}, {0xc6,0x0e26}, {0xc7,0x0e27}, {0xc8,0x0e28}, 
{0xc9,0x0e29}, {0xca,0x0e2a}, {0xcb,0x0e2b}, {0xcc,0x0e2c}, {0xcd,0x0e2d}, 
{0xce,0x0e2e}, {0xcf,0x0e2f}, {0xd0,0x0e30}, {0xd1,0x0e31}, {0xd2,0x0e32}, 
{0xd3,0x0e33}, {0xd4,0x0e34}, {0xd5,0x0e35}, {0xd6,0x0e36}, {0xd7,0x0e37}, 
{0xd8,0x0e38}, {0xd9,0x0e39}, {0xda,0x0e3a}, {0xdf,0x0e3f}, {0xe0,0x0e40}, 
{0xe1,0x0e41}, {0xe2,0x0e42}, {0xe3,0x0e43}, {0xe4,0x0e44}, {0xe5,0x0e45}, 
{0xe6,0x0e46}, {0xe7,0x0e47}, {0xe8,0x0e48}, {0xe9,0x0e49}, {0xea,0x0e4a}, 
{0xeb,0x0e4b}, {0xec,0x0e4c}, {0xed,0x0e4d}, {0xee,0x0e4e}, {0xef,0x0e4f}, 
{0xf0,0x0e50}, {0xf1,0x0e51}, {0xf2,0x0e52}, {0xf3,0x0e53}, {0xf4,0x0e54}, 
{0xf5,0x0e55}, {0xf6,0x0e56}, {0xf7,0x0e57}, {0xf8,0x0e58}, {0xf9,0x0e59}, 
{0xfa,0x0e5a}, {0xfb,0x0e5b}, };

@implementation CWISO8859_11

- (id) init
{
	return [super initWithCodeCharTable: code_table  length: sizeof(code_table)/sizeof(code_table[0])];
}

- (NSString *) name
{
	return @"iso-8859-11";
}

@end

