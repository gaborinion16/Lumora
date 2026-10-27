pragma Singleton

import QtQuick

// Lumora skin — graphite ground, warm ivory text, champagne-gold accent.
// Token names are unchanged from upstream so every control picks these up.
QtObject {
    property QtObject color: QtObject {
        readonly property color transparent: 'transparent'

        readonly property color textPrimary: '#ECE8E0'
        readonly property color textSecondary: '#D6D2C9'
        readonly property color textTertiary: '#A9A59C'
        readonly property color textQuaternary: '#8C887F'
        readonly property color textInverted: '#0F1014'
        readonly property color textAccent: '#D8BC86'
        readonly property color textInfoInverse: '#3E5A7A'
        readonly property color textStaticWhite: '#FFFFFF'

        readonly property color bgBase: '#0F1014'
        readonly property color bgSurface: '#15171C'
        readonly property color bgSurfaceAlt: '#1A1C22'
        readonly property color bgSheet: '#1F2127'
        readonly property color bgPanel: '#2A2D35'
        readonly property color bgPanelAlt: '#3A3D46'
        readonly property color bgOverlay: '#B30B0C0F'
        readonly property color bgStateLayer: '#12ECE8E0'
        readonly property color bgStateLayerPressed: '#1CECE8E0'
        readonly property color bgStateLayerAccent: '#14D8BC86'
        readonly property color bgSurfaceInverse: '#ECE8E0'
        readonly property color bgSurfaceInverseAlt: '#D6D2C9'
        readonly property color bgControlTrack: '#23252C'
        readonly property color bgField: '#15171C'
        readonly property color bgSelected: '#1A1916'
        readonly property color bgAccentSubtle: '#33D8BC86'
        readonly property color bgStaticWhite: '#FFFFFF'

        readonly property color bgAction: '#D8BC86'
        readonly property color bgActionHover: '#E4CB9B'
        readonly property color bgActionPress: '#B99D68'

        readonly property color borderFaint: '#1F2127'
        readonly property color borderSoft: '#23252C'
        readonly property color borderMedium: '#2E3139'
        readonly property color borderBold: '#8C887F'
        readonly property color borderEmphasis: '#ECE8E0'
        readonly property color borderAccent: '#D8BC86'
        readonly property color borderField: '#2E3139'
        readonly property color borderFocus: '#D8BC86'

        readonly property color accentLight: '#EAD3A6'
        readonly property color accentDefault: '#D8BC86'
        readonly property color accentDark: '#B99D68'
        readonly property color accentDeep: '#4A4232'

        readonly property color statusDestructive: '#E58C7E'
        readonly property color statusWarning: '#E2B65C'
        readonly property color statusSuccess: '#9DB8A8'

        readonly property color promoRecommendation: '#B7A6D9'
        readonly property color promoUpdate: '#A9B4D6'
        readonly property color promoOverlay: '#14A9B4D6'
        readonly property color promoPink: '#C77D93'
        readonly property color promoPinkDeep: '#7A4253'

        readonly property color iconDefault: '#ECE8E0'
        readonly property color iconSecondary: '#A9A59C'
        readonly property color iconTertiary: '#3A3D46'
        readonly property color iconInverted: '#0F1014'

        readonly property color shadowLayer1: '#26000000'
        readonly property color shadowLayer2: '#4D000000'
        readonly property color shadowGlow: '#D8BC86'
    }
}
